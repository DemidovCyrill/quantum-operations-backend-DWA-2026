<mxfile host="Electron" agent="OpenCode">
  <diagram name="Class Diagram" id="class-diagram">
    <mxGraphModel dx="1174" dy="916" grid="0" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="0" pageScale="1" pageWidth="1400" pageHeight="900" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="GUUg8WeGAu17Da1eKSuY-101" parent="1" style="whiteSpace=wrap;html=1;verticalAlign=top;" value="" vertex="1">
          <mxGeometry height="271" width="309" x="648" y="104" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-64" parent="1" style="whiteSpace=wrap;html=1;verticalAlign=top;" value="" vertex="1">
          <mxGeometry height="490" width="161" x="404" y="-15" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-59" parent="1" style="whiteSpace=wrap;html=1;verticalAlign=top;" value="" vertex="1">
          <mxGeometry height="365" width="249" x="58" y="34" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-19" parent="1" style="whiteSpace=wrap;html=1;verticalAlign=top;" value="" vertex="1">
          <mxGeometry height="275" width="140" x="-308" y="90" as="geometry" />
        </mxCell>
        <mxCell id="webservice" parent="1" style="rounded=1;whiteSpace=wrap;html=1;fontStyle=1;fontSize=14;strokeColor=none;" value="Веб-сервис" vertex="1">
          <mxGeometry height="40" width="120" x="117" y="52" as="geometry" />
        </mxCell>
        <mxCell id="gates-api" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="Домен гейтов /api/gates" vertex="1">
          <mxGeometry height="30" width="200" x="82" y="104" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-84" edge="1" parent="1" source="gates-api-methods" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;dashed=1;exitX=0.985;exitY=0.303;exitDx=0;exitDy=0;exitPerimeter=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="model-user">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="gates-api-methods" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;" value="+GET /api/gates()&#xa;+GET /api/gates/feed()&#xa;+GET /api/gates/draft()&#xa;+POST /api/gates()&#xa;+PUT /api/gates/{id}/publish()&#xa;+DELETE /api/gates/{id}()&#xa;+POST /api/gates/{id}/like()" vertex="1">
          <mxGeometry height="120" width="200" x="82" y="134" as="geometry" />
        </mxCell>
        <mxCell id="users-api" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="Домен пользователя /api/users" vertex="1">
          <mxGeometry height="30" width="200" x="82" y="274" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-86" edge="1" parent="1" source="users-api-methods" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;" target="model-user-fields">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="users-api-methods" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;" value="+POST /api/users/register()&#xa;+POST /api/users/login()&#xa;+POST /api/users/logout()" vertex="1">
          <mxGeometry height="70" width="200" x="82" y="304" as="geometry" />
        </mxCell>
        <mxCell id="models" parent="1" style="rounded=1;whiteSpace=wrap;html=1;fontStyle=1;fontSize=14;strokeColor=none;" value="Модель" vertex="1">
          <mxGeometry height="40" width="120" x="425" y="-10" as="geometry" />
        </mxCell>
        <mxCell id="model-gate" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="Gate" vertex="1">
          <mxGeometry height="30" width="120" x="425" y="50" as="geometry" />
        </mxCell>
        <mxCell id="model-gate-fields" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;" value="+ id: int&lt;br&gt;+ title: str&lt;br&gt;+ summary: str&lt;br&gt;+ status: str&lt;br&gt;+ image_url: str&lt;br&gt;+ video_url: str&lt;br&gt;+ angle_x: int&lt;br&gt;+ angle_y: int&lt;br&gt;+ creator_id: int" vertex="1">
          <mxGeometry height="140" width="120" x="425" y="80" as="geometry" />
        </mxCell>
        <mxCell id="model-user" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="User" vertex="1">
          <mxGeometry height="30" width="120" x="425" y="240" as="geometry" />
        </mxCell>
        <mxCell id="model-user-fields" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;" value="+ id: int&lt;br&gt;+ username: str&lt;br&gt;+ email: str&lt;br&gt;+ created_at: datetime" vertex="1">
          <mxGeometry height="70" width="120" x="425" y="270" as="geometry" />
        </mxCell>
        <mxCell id="model-like" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="Like" vertex="1">
          <mxGeometry height="30" width="120" x="425" y="360" as="geometry" />
        </mxCell>
        <mxCell id="model-like-fields" parent="1" style="rounded=0;whiteSpace=wrap;html=1;align=left;spacingLeft=10;" value="+ id: int&lt;br&gt;+ user_id: int&lt;br&gt;+ gate_id: int&lt;br&gt;+ created_at: datetime" vertex="1">
          <mxGeometry height="70" width="120" x="425" y="390" as="geometry" />
        </mxCell>
        <mxCell id="database" parent="1" style="rounded=1;whiteSpace=wrap;html=1;fontStyle=1;fontSize=14;strokeColor=none;" value="База данных" vertex="1">
          <mxGeometry height="40" width="120" x="734.5" y="107" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-1" parent="1" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="48.57" width="100" x="-268" y="-10" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-2" parent="GUUg8WeGAu17Da1eKSuY-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="28" width="100" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-3" parent="GUUg8WeGAu17Da1eKSuY-2" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="&lt;span style=&quot;font-size: 14px; font-weight: 700;&quot;&gt;Postman&lt;/span&gt;" vertex="1">
          <mxGeometry height="28" width="100" as="geometry">
            <mxRectangle height="28" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-4" parent="GUUg8WeGAu17Da1eKSuY-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="11" width="100" y="28" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-5" parent="GUUg8WeGAu17Da1eKSuY-4" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="11" width="100" as="geometry">
            <mxRectangle height="11" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-6" parent="GUUg8WeGAu17Da1eKSuY-1" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="10" width="100" y="39" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-7" parent="GUUg8WeGAu17Da1eKSuY-6" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="10" width="100" as="geometry">
            <mxRectangle height="10" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-20" parent="1" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="48.57" width="65" x="-272" y="132" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-21" parent="GUUg8WeGAu17Da1eKSuY-20" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="28" width="65" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-22" parent="GUUg8WeGAu17Da1eKSuY-21" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="Плитка" vertex="1">
          <mxGeometry height="28" width="65" as="geometry">
            <mxRectangle height="28" width="65" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-23" parent="GUUg8WeGAu17Da1eKSuY-20" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="11" width="65" y="28" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-24" parent="GUUg8WeGAu17Da1eKSuY-23" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="11" width="65" as="geometry">
            <mxRectangle height="11" width="65" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-25" parent="GUUg8WeGAu17Da1eKSuY-20" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="10" width="65" y="39" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-26" parent="GUUg8WeGAu17Da1eKSuY-25" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="10" width="65" as="geometry">
            <mxRectangle height="10" width="65" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-27" parent="1" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="48.57" width="68" x="-273.5" y="187" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-28" parent="GUUg8WeGAu17Da1eKSuY-27" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="28" width="68" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-29" parent="GUUg8WeGAu17Da1eKSuY-28" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="Лента" vertex="1">
          <mxGeometry height="28" width="68" as="geometry">
            <mxRectangle height="28" width="68" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-30" parent="GUUg8WeGAu17Da1eKSuY-27" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="11" width="68" y="28" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-31" parent="GUUg8WeGAu17Da1eKSuY-30" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="11" width="68" as="geometry">
            <mxRectangle height="11" width="68" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-32" parent="GUUg8WeGAu17Da1eKSuY-27" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="10" width="68" y="39" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-33" parent="GUUg8WeGAu17Da1eKSuY-32" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="10" width="68" as="geometry">
            <mxRectangle height="10" width="68" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-34" parent="1" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="48.57" width="100" x="-288" y="305" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-35" parent="GUUg8WeGAu17Da1eKSuY-34" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="28" width="100" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-36" parent="GUUg8WeGAu17Da1eKSuY-35" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="Добавить" vertex="1">
          <mxGeometry height="28" width="100" as="geometry">
            <mxRectangle height="28" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-37" parent="GUUg8WeGAu17Da1eKSuY-34" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="11" width="100" y="28" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-38" parent="GUUg8WeGAu17Da1eKSuY-37" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="11" width="100" as="geometry">
            <mxRectangle height="11" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-39" parent="GUUg8WeGAu17Da1eKSuY-34" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="10" width="100" y="39" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-40" parent="GUUg8WeGAu17Da1eKSuY-39" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="10" width="100" as="geometry">
            <mxRectangle height="10" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-48" parent="1" style="shape=table;startSize=0;container=1;collapsible=0;childLayout=tableLayout;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="48.57" width="100" x="-288" y="245" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-49" parent="GUUg8WeGAu17Da1eKSuY-48" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="28" width="100" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-50" parent="GUUg8WeGAu17Da1eKSuY-49" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="Профиль" vertex="1">
          <mxGeometry height="28" width="100" as="geometry">
            <mxRectangle height="28" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-51" parent="GUUg8WeGAu17Da1eKSuY-48" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="11" width="100" y="28" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-52" parent="GUUg8WeGAu17Da1eKSuY-51" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="11" width="100" as="geometry">
            <mxRectangle height="11" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-53" parent="GUUg8WeGAu17Da1eKSuY-48" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;strokeColor=inherit;top=0;left=0;bottom=0;right=0;collapsible=0;dropTarget=0;fillColor=none;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fixedHeader=1;" value="" vertex="1">
          <mxGeometry height="10" width="100" y="39" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-54" parent="GUUg8WeGAu17Da1eKSuY-53" style="shape=partialRectangle;html=1;whiteSpace=wrap;connectable=0;strokeColor=inherit;overflow=hidden;fillColor=none;top=0;left=0;bottom=0;right=0;pointerEvents=1;" value="" vertex="1">
          <mxGeometry height="10" width="100" as="geometry">
            <mxRectangle height="10" width="100" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-56" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="15" width="43" x="-308" y="75" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-57" parent="1" style="rounded=1;whiteSpace=wrap;html=1;fontStyle=1;fontSize=14;strokeColor=none;" value="Фронтенд" vertex="1">
          <mxGeometry height="34" width="113" x="-297.5" y="94" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-60" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="15" width="75" x="58" y="19" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-66" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="15" width="58" x="404" y="-30" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-67" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-6" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.004;entryY=0.109;entryDx=0;entryDy=0;shape=wire;dashed=1;endArrow=none;endFill=0;curved=0;entryPerimeter=0;exitX=1;exitY=0.5;exitDx=0;exitDy=0;" target="gates-api-methods">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="-122" y="36" />
              <mxPoint x="-122" y="147.12" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-68" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-4" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;entryX=-0.001;entryY=0.332;entryDx=0;entryDy=0;endArrow=none;endFill=0;curved=0;entryPerimeter=0;" target="users-api-methods">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="-22.25" y="25.5" />
              <mxPoint x="-22.25" y="327.17" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-69" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-21" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.001;entryY=0.101;entryDx=0;entryDy=0;entryPerimeter=0;endArrow=none;endFill=0;" target="gates-api-methods">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-70" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-28" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.01;entryY=0.101;entryDx=0;entryDy=0;entryPerimeter=0;endArrow=none;endFill=0;curved=0;" target="gates-api-methods">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="-123.3" y="201" />
              <mxPoint x="-123.3" y="146.1" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-71" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-49" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.008;entryY=0.108;entryDx=0;entryDy=0;entryPerimeter=0;curved=0;endArrow=none;endFill=0;" target="gates-api-methods">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="-124.7" y="259" />
              <mxPoint x="-124.7" y="147" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-72" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-35" style="edgeStyle=orthogonalEdgeStyle;rounded=1;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.017;entryY=0.325;entryDx=0;entryDy=0;entryPerimeter=0;curved=0;endArrow=none;endFill=0;exitX=0.98;exitY=0.711;exitDx=0;exitDy=0;exitPerimeter=0;" target="users-api-methods">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-76" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="27.701414353133522" width="25.075367848076098" x="9.0046321519239" y="313.00022293357847" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-73" parent="GUUg8WeGAu17Da1eKSuY-76" style="ellipse;whiteSpace=wrap;html=1;shapeInside=1;" value="" vertex="1">
          <mxGeometry height="21" width="22" x="3.075367848076098" y="2.879777066421525" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-75" parent="GUUg8WeGAu17Da1eKSuY-76" style="shape=stencil(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);lineShape=1;strokeColor=default;" value="" vertex="1">
          <mxGeometry height="27.701414353133522" width="14.425399540100516" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-77" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="27.701414353133522" width="25.075367848076098" x="-85" y="134" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-78" parent="GUUg8WeGAu17Da1eKSuY-77" style="ellipse;whiteSpace=wrap;html=1;shapeInside=1;" value="" vertex="1">
          <mxGeometry height="21" width="22" x="3.075367848076098" y="2.879777066421525" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-79" parent="GUUg8WeGAu17Da1eKSuY-77" style="shape=stencil(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);lineShape=1;strokeColor=default;" value="" vertex="1">
          <mxGeometry height="27.701414353133522" width="14.425399540100516" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-81" parent="1" style="rounded=1;whiteSpace=wrap;html=1;fontStyle=1;fontSize=10;strokeColor=none;" value="API licencings" vertex="1">
          <mxGeometry height="21" width="75" x="-106" y="166" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-82" parent="1" style="rounded=1;whiteSpace=wrap;html=1;fontStyle=1;fontSize=10;strokeColor=none;" value="API users" vertex="1">
          <mxGeometry height="21" width="75" x="-19" y="344" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-83" edge="1" parent="1" source="gates-api-methods" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=-0.004;entryY=0.125;entryDx=0;entryDy=0;entryPerimeter=0;dashed=1;" target="model-gate-fields">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-85" edge="1" parent="1" source="gates-api-methods" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.001;entryY=0.132;entryDx=0;entryDy=0;entryPerimeter=0;dashed=1;exitX=0.996;exitY=0.59;exitDx=0;exitDy=0;exitPerimeter=0;" target="model-like-fields">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-90" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-87" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.75;entryY=0;entryDx=0;entryDy=0;endArrow=none;endFill=0;exitX=0.75;exitY=1;exitDx=0;exitDy=0;" target="GUUg8WeGAu17Da1eKSuY-89">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-87" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="Gate" vertex="1">
          <mxGeometry height="30" width="69" x="785.5" y="178" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-88" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="User" vertex="1">
          <mxGeometry height="30" width="69" x="682" y="270" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-89" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fontStyle=1;" value="Like" vertex="1">
          <mxGeometry height="30" width="69" x="850" y="321" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-91" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-87" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;endArrow=none;endFill=0;exitX=0;exitY=0.5;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" target="GUUg8WeGAu17Da1eKSuY-88">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="724" y="157" as="sourcePoint" />
            <mxPoint x="712.89" y="267.56" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-98" connectable="0" parent="GUUg8WeGAu17Da1eKSuY-91" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="0..1" vertex="1">
          <mxGeometry relative="1" x="0.6885" y="-1" as="geometry">
            <mxPoint x="-16" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-93" edge="1" parent="1" source="GUUg8WeGAu17Da1eKSuY-88" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;endArrow=none;endFill=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="GUUg8WeGAu17Da1eKSuY-89">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="783" y="245" as="sourcePoint" />
            <mxPoint x="795.67" y="338.67" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-95" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="0..*" vertex="1">
          <mxGeometry height="30" width="60" x="805" y="309" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-96" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="0..*" vertex="1">
          <mxGeometry height="30" width="60" x="880" y="294" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-97" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="0..*" vertex="1">
          <mxGeometry height="30" width="60" x="735" y="178" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-99" connectable="0" parent="1" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="0..1" vertex="1">
          <mxGeometry x="765" y="300" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-100" connectable="0" parent="1" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];" value="0..1" vertex="1">
          <mxGeometry x="858" y="219" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-102" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="15" width="58" x="648" y="89" as="geometry" />
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-103" edge="1" parent="1" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0.75;entryY=0;entryDx=0;entryDy=0;dashed=1;" target="GUUg8WeGAu17Da1eKSuY-97">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="545" y="167" as="sourcePoint" />
            <mxPoint x="688" y="111" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-104" edge="1" parent="1" source="model-user-fields" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=0.5;entryDx=0;entryDy=0;dashed=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;" target="GUUg8WeGAu17Da1eKSuY-88">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="561" y="295" as="sourcePoint" />
            <mxPoint x="704" y="239" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="GUUg8WeGAu17Da1eKSuY-105" edge="1" parent="1" source="model-like-fields" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;entryX=0;entryY=1;entryDx=0;entryDy=0;dashed=1;exitX=1;exitY=0.25;exitDx=0;exitDy=0;" target="GUUg8WeGAu17Da1eKSuY-89">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="632" y="482" as="sourcePoint" />
            <mxPoint x="775" y="426" as="targetPoint" />
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
