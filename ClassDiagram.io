<mxfile host="app.diagrams.net" modified="2026-10-19T00:00:00.000Z" agent="OpenCode" version="24.0.0">
  <diagram name="Class Diagram" id="class-diagram">
    <mxGraphModel dx="600" dy="900" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="600" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />

        <!-- Postman -->
        <mxCell id="postman" value="Postman" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=9;" vertex="1" parent="1">
          <mxGeometry x="20" y="20" width="80" height="25" as="geometry" />
        </mxCell>

        <!-- Frontend -->
        <mxCell id="frontend" value="Фронтенд" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=9;" vertex="1" parent="1">
          <mxGeometry x="20" y="80" width="80" height="20" as="geometry" />
        </mxCell>
        <mxCell id="frontend-grid" value="Плитка" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="20" y="105" width="80" height="18" as="geometry" />
        </mxCell>
        <mxCell id="frontend-feed" value="Лента" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="20" y="127" width="80" height="18" as="geometry" />
        </mxCell>
        <mxCell id="frontend-add" value="Добавить" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="20" y="149" width="80" height="18" as="geometry" />
        </mxCell>

        <!-- Web Service -->
        <mxCell id="webservice" value="Веб-сервис" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=9;" vertex="1" parent="1">
          <mxGeometry x="150" y="20" width="100" height="20" as="geometry" />
        </mxCell>

        <!-- Gates API -->
        <mxCell id="gates-api" value="Домен гейтов /api/gates" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="150" y="50" width="100" height="18" as="geometry" />
        </mxCell>
        <mxCell id="gates-api-methods" value="+GET /api/gates()&#xa;+GET /api/gates/feed()&#xa;+GET /api/gates/draft()&#xa;+POST /api/gates()&#xa;+PUT /api/gates/{id}/publish()&#xa;+DELETE /api/gates/{id}()&#xa;+POST /api/gates/{id}/like()" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;align=left;spacingLeft=5;fontSize=7;" vertex="1" parent="1">
          <mxGeometry x="150" y="72" width="100" height="80" as="geometry" />
        </mxCell>

        <!-- Users API -->
        <mxCell id="users-api" value="Домен пользователя /api/users" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="150" y="160" width="100" height="18" as="geometry" />
        </mxCell>
        <mxCell id="users-api-methods" value="+POST /api/users/register()&#xa;+POST /api/users/login()&#xa;+POST /api/users/logout()" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;align=left;spacingLeft=5;fontSize=7;" vertex="1" parent="1">
          <mxGeometry x="150" y="182" width="100" height="50" as="geometry" />
        </mxCell>

        <!-- Models -->
        <mxCell id="models" value="Модель" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=9;" vertex="1" parent="1">
          <mxGeometry x="300" y="20" width="80" height="20" as="geometry" />
        </mxCell>

        <!-- Gate Model -->
        <mxCell id="model-gate" value="Gate" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="300" y="50" width="80" height="18" as="geometry" />
        </mxCell>
        <mxCell id="model-gate-fields" value="- id&#xa;- title&#xa;- summary&#xa;- status&#xa;- image_url&#xa;- video_url&#xa;- angle_x&#xa;- angle_y&#xa;- creator_id" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;align=left;spacingLeft=5;fontSize=7;" vertex="1" parent="1">
          <mxGeometry x="300" y="72" width="80" height="90" as="geometry" />
        </mxCell>

        <!-- User Model -->
        <mxCell id="model-user" value="User" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="300" y="170" width="80" height="18" as="geometry" />
        </mxCell>
        <mxCell id="model-user-fields" value="- id&#xa;- username&#xa;- email&#xa;- password" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;align=left;spacingLeft=5;fontSize=7;" vertex="1" parent="1">
          <mxGeometry x="300" y="192" width="80" height="50" as="geometry" />
        </mxCell>

        <!-- Like Model -->
        <mxCell id="model-like" value="Like" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="300" y="250" width="80" height="18" as="geometry" />
        </mxCell>
        <mxCell id="model-like-fields" value="- id&#xa;- user_id&#xa;- gate_id" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;align=left;spacingLeft=5;fontSize=7;" vertex="1" parent="1">
          <mxGeometry x="300" y="272" width="80" height="40" as="geometry" />
        </mxCell>

        <!-- Database -->
        <mxCell id="database" value="База данных" style="rounded=1;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=9;" vertex="1" parent="1">
          <mxGeometry x="430" y="20" width="80" height="20" as="geometry" />
        </mxCell>

        <!-- DB Tables -->
        <mxCell id="db-gates" value="gates" style="shape=cylinder3;whiteSpace=wrap;html=1;boundedLbl=1;backgroundOutline=1;size=10;fillColor=#ffffff;strokeColor=#000000;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="430" y="50" width="60" height="40" as="geometry" />
        </mxCell>
        <mxCell id="db-users" value="users" style="shape=cylinder3;whiteSpace=wrap;html=1;boundedLbl=1;backgroundOutline=1;size=10;fillColor=#ffffff;strokeColor=#000000;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="430" y="110" width="60" height="40" as="geometry" />
        </mxCell>
        <mxCell id="db-likes" value="likes" style="shape=cylinder3;whiteSpace=wrap;html=1;boundedLbl=1;backgroundOutline=1;size=10;fillColor=#ffffff;strokeColor=#000000;fontSize=8;" vertex="1" parent="1">
          <mxGeometry x="430" y="170" width="60" height="40" as="geometry" />
        </mxCell>

        <!-- Relationships -->
        <mxCell id="rel-postman-gates" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="postman" target="gates-api">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-frontend-gates" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="frontend" target="gates-api">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-gates-model" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;" edge="1" parent="1" source="gates-api" target="model-gate">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-users-model" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;" edge="1" parent="1" source="users-api" target="model-user">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-model-gate-db" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;" edge="1" parent="1" source="model-gate" target="db-gates">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-model-user-db" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;" edge="1" parent="1" source="model-user" target="db-users">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-model-like-db" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;" edge="1" parent="1" source="model-like" target="db-likes">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>