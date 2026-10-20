<mxfile host="Electron" agent="OpenCode">
  <diagram name="Sequence Diagram" id="sequence-diagram">
    <mxGraphModel dx="1041" dy="622" grid="0" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1000" pageHeight="800" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="title" parent="1" style="text;html=1;align=left;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=14;fontStyle=1;" value="SD Диаграмма последовательности" vertex="1">
          <mxGeometry height="30" width="300" x="20" y="10" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-frontend" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=11;" value="Фронтенд" vertex="1">
          <mxGeometry height="30" width="100" x="80" y="50" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-frontend-line" edge="1" parent="1" source="lifeline-frontend" style="endArrow=none;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="632.64" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="lifeline-users" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=11;" value=": Домен users" vertex="1">
          <mxGeometry height="30" width="120" x="350" y="50" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-users-line" edge="1" parent="1" source="lifeline-users" style="endArrow=none;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="410" y="636.1" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="lifeline-gates" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=11;" value=": Домен gates" vertex="1">
          <mxGeometry height="30" width="120" x="650" y="50" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-gates-line" edge="1" parent="1" source="lifeline-gates" style="endArrow=none;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="633.02" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg1" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=10;" value="1 : POST /api/users/login(login, password)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="100" as="sourcePoint" />
            <mxPoint x="410" y="100" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg2" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=10;" value="2 : 200 JSON(access_token=JWT, token_type=Bearer, user_id, role, expires_in)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="410" y="130" as="sourcePoint" />
            <mxPoint x="130" y="130" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg3" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=9;" value="3 : GET /api/gates?q&amp;angle_x_min&amp;angle_x_max&amp;angle_y_min&amp;angle_y_max (Authorization=Bearer JWT)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="170" as="sourcePoint" />
            <mxPoint x="710" y="170" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg4" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=10;" value="4 : 200 JSON(gates[], total)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="200" as="sourcePoint" />
            <mxPoint x="130" y="200" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg5" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=9;" value="5 : POST /api/gates(title, image=файл, video=файл, Authorization=Bearer JWT; multipart/form-data)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="240" as="sourcePoint" />
            <mxPoint x="710" y="240" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg6" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=9;" value="6 : 201 JSON(gate_id=draft_id, status=черновик, creator_id=user_id, image_name, video_name)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="270" as="sourcePoint" />
            <mxPoint x="130" y="270" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg7" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=10;" value="7 : GET /api/gates/draft(Authorization=Bearer JWT)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="310" as="sourcePoint" />
            <mxPoint x="710" y="310" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg8" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=9;" value="8 : 200 JSON(gate_id=draft_id, name, short_description, image_name, video_name, status=черновик)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="340" as="sourcePoint" />
            <mxPoint x="130" y="340" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg9" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=9;" value="9 : PUT /api/gates/{id}/publish(id=draft_id, name, short_description, angle_x, angle_y, Authorization=Bearer JWT)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="380" as="sourcePoint" />
            <mxPoint x="710" y="380" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg10" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=9;" value="10 : 200 JSON(gate_id=draft_id, status=опубликован, name, short_description, angle_x, angle_y, formed_at)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="410" as="sourcePoint" />
            <mxPoint x="130" y="410" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg11" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=10;" value="11 : GET /api/gates/feed(Authorization=Bearer JWT)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="450" as="sourcePoint" />
            <mxPoint x="710" y="450" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg12" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=10;" value="12 : 200 JSON(gates[], total)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="480" as="sourcePoint" />
            <mxPoint x="130" y="480" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg13" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=9;" value="13 : GET /api/gates/feed/{id}?next=true(id=feed_id, next=true, Authorization=Bearer JWT)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="520" as="sourcePoint" />
            <mxPoint x="710" y="520" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg14" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=9;" value="14 : 200 JSON(gate_id=next_id, name, video_url, is_liked, like_count)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="550" as="sourcePoint" />
            <mxPoint x="130" y="550" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg15" edge="1" parent="1" style="endArrow=block;endFill=1;html=1;verticalAlign=bottom;fontSize=9;" value="15 : POST /api/gates/{id}/likes(id=next_id, value=1, Authorization=Bearer JWT)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="590" as="sourcePoint" />
            <mxPoint x="710" y="590" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg16" edge="1" parent="1" style="endArrow=open;endFill=0;dashed=1;html=1;verticalAlign=bottom;fontSize=9;" value="16 : 200 JSON(gate_id=next_id, is_liked=1, like_count)">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="710" y="620" as="sourcePoint" />
            <mxPoint x="130" y="620" as="targetPoint" />
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
