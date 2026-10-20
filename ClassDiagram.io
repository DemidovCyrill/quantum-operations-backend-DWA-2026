<mxfile host="Electron" agent="OpenCode">
  <diagram name="Class Diagram" id="class-diagram">
    <mxGraphModel dx="1041" dy="622" grid="0" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="800" pageHeight="1000" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="react-app" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=11;verticalAlign=top;align=center;" value="React приложение" vertex="1">
          <mxGeometry height="109" width="481.7" x="172" y="31" as="geometry" />
        </mxCell>
        <mxCell id="page-feed" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=10;" value="Лента" vertex="1">
          <mxGeometry height="45" width="80" x="193" y="66" as="geometry" />
        </mxCell>
        <mxCell id="page-add" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=9;" value="Страница&#xa;добавления&#xa;гейта" vertex="1">
          <mxGeometry height="45" width="80" x="311" y="66" as="geometry" />
        </mxCell>
        <mxCell id="page-grid" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=10;" value="Плитка" vertex="1">
          <mxGeometry height="45" width="80" x="429" y="66" as="geometry" />
        </mxCell>
        <mxCell id="page-auth" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=9;" value="Страница&#xa;аутентификации" vertex="1">
          <mxGeometry height="45" width="80" x="547" y="66" as="geometry" />
        </mxCell>
        <mxCell id="api-gates-label" parent="1" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=10;" value="API gates" vertex="1">
          <mxGeometry height="20" width="80" x="283.5" y="167" as="geometry" />
        </mxCell>
        <mxCell id="api-users-label" parent="1" style="text;html=1;align=center;verticalAlign=middle;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=10;" value="API users" vertex="1">
          <mxGeometry height="20" width="80" x="466" y="163" as="geometry" />
        </mxCell>
        <mxCell id="backend" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=11;verticalAlign=top;align=center;" value="Бэкенд" vertex="1">
          <mxGeometry height="169" width="512" x="164" y="209.93" as="geometry" />
        </mxCell>
        <mxCell id="model-container" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=11;verticalAlign=top;align=center;" value="Модель" vertex="1">
          <mxGeometry height="120" width="602" x="105.30000000000001" y="421.93" as="geometry" />
        </mxCell>
        <mxCell id="model-gate" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" value="Gate" vertex="1">
          <mxGeometry height="60" width="150" x="127.30000000000001" y="451.93" as="geometry" />
        </mxCell>
        <mxCell id="model-user" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" value="User" vertex="1">
          <mxGeometry height="60" width="150" x="322.15" y="451.93" as="geometry" />
        </mxCell>
        <mxCell id="model-like" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" value="Like" vertex="1">
          <mxGeometry height="60" width="150" x="517.3" y="451.93" as="geometry" />
        </mxCell>
        <mxCell id="database" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=11;verticalAlign=top;align=center;" value="База данных" vertex="1">
          <mxGeometry height="120" width="512" x="151.15" y="579.93" as="geometry" />
        </mxCell>
        <mxCell id="rel-gates-model" edge="1" parent="1" source="domain-gates" style="endArrow=open;endFill=0;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" target="model-gate" value="">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-users-model" edge="1" parent="1" source="domain-users" style="endArrow=open;endFill=0;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" target="model-user" value="">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-model-gate-db" edge="1" parent="1" source="model-gate" style="endArrow=open;endFill=0;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" target="xjCEGFBqJN23oKtGqnzH-22" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="117.15" y="678.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-model-user-db" edge="1" parent="1" source="model-user" style="endArrow=open;endFill=0;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryX=0.584;entryY=0.007;entryDx=0;entryDy=0;entryPerimeter=0;" target="xjCEGFBqJN23oKtGqnzH-24" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="387.14999999999975" y="678.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-model-like-db" edge="1" parent="1" source="model-like" style="endArrow=open;endFill=0;dashed=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;" target="xjCEGFBqJN23oKtGqnzH-25" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="657.15" y="678.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-1" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="124.63999999999999" width="240" x="190" y="249.93" as="geometry" />
        </mxCell>
        <mxCell id="domain-gates" parent="xjCEGFBqJN23oKtGqnzH-1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;verticalAlign=top;align=center;" value="Домен gates" vertex="1">
          <mxGeometry height="114.99999999999999" width="132" as="geometry" />
        </mxCell>
        <mxCell id="domain-gates-methods" parent="xjCEGFBqJN23oKtGqnzH-1" style="text;html=1;align=left;verticalAlign=top;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=9;" value="+GET /api/gates()&#xa;+GET /api/gates/feed()&#xa;+GET /api/gates/draft()&#xa;+POST /api/gates()&#xa;+PUT /api/gates/{id}/publish()&#xa;+DELETE /api/gates/{id}()&#xa;+POST /api/gates/{id}/like()" vertex="1">
          <mxGeometry height="100" width="280" x="4.3999999999999995" y="24.64285714285714" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-47" parent="xjCEGFBqJN23oKtGqnzH-1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="132" y="21" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-2" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="86" width="154" x="496" y="249.93" as="geometry" />
        </mxCell>
        <mxCell id="domain-users" parent="xjCEGFBqJN23oKtGqnzH-2" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;verticalAlign=top;align=center;" value="Домен users" vertex="1">
          <mxGeometry height="86" width="154" as="geometry" />
        </mxCell>
        <mxCell id="domain-users-methods" parent="xjCEGFBqJN23oKtGqnzH-2" style="text;html=1;align=left;verticalAlign=top;resizable=0;points=[];autosize=1;strokeColor=none;fillColor=none;fontSize=9;" value="+POST /api/users/register()&#xa;+POST /api/users/login()&#xa;+POST /api/users/logout()" vertex="1">
          <mxGeometry height="80" width="180" x="4.15" y="31.99857142857143" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-46" parent="xjCEGFBqJN23oKtGqnzH-2" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="154" y="25" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-4" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="193" y="111" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-5" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="193" y="118" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-6" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="311" y="111" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-7" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="311" y="118" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-8" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="429" y="111" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-9" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="429" y="118" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-10" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="547" y="111" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-12" edge="1" parent="1" source="xjCEGFBqJN23oKtGqnzH-11" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=0.778;entryY=0.088;entryDx=0;entryDy=0;entryPerimeter=0;" target="xjCEGFBqJN23oKtGqnzH-15">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="561.67" y="168.11" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-11" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="80" x="547" y="118" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-16" edge="1" parent="1" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=0.668;entryY=0.04;entryDx=0;entryDy=0;entryPerimeter=0;" target="xjCEGFBqJN23oKtGqnzH-14">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="466" y="125" as="sourcePoint" />
            <mxPoint x="420" y="176" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-17" edge="1" parent="1" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=0.642;entryY=0.041;entryDx=0;entryDy=0;entryPerimeter=0;" target="xjCEGFBqJN23oKtGqnzH-14">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="352" y="125" as="sourcePoint" />
            <mxPoint x="306" y="176" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-18" edge="1" parent="1" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0.5;exitY=1;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=0.716;entryY=0.033;entryDx=0;entryDy=0;entryPerimeter=0;" target="xjCEGFBqJN23oKtGqnzH-14">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="239" y="125" as="sourcePoint" />
            <mxPoint x="287.88" y="178.2" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-19" edge="1" parent="1" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=-0.006;exitY=0.998;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;exitPerimeter=0;" target="domain-gates">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="285.66999999999973" y="178.89000000000004" as="sourcePoint" />
            <mxPoint x="285.15" y="243.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-20" edge="1" parent="1" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=1;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=0.5;entryY=0;entryDx=0;entryDy=0;" target="domain-users">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="554.221068" y="176.00106799999998" as="sourcePoint" />
            <mxPoint x="581.15" y="227.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-21" edge="1" parent="1" source="domain-users" style="endArrow=open;endFill=0;dashed=1;entryX=0.448;entryY=0.043;entryDx=0;entryDy=0;exitX=0.5;exitY=1;exitDx=0;exitDy=0;entryPerimeter=0;" target="model-like" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="657.15" y="412.93" as="sourcePoint" />
            <mxPoint x="466.15" y="591.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-22" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" value="Gate" vertex="1">
          <mxGeometry height="34" width="75" x="270.15" y="618.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-24" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" value="User" vertex="1">
          <mxGeometry height="34" width="75" x="443.15" y="659.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-25" parent="1" style="rounded=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" value="Like" vertex="1">
          <mxGeometry height="34" width="75" x="565.15" y="592.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-27" edge="1" parent="1" source="xjCEGFBqJN23oKtGqnzH-22" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="xjCEGFBqJN23oKtGqnzH-24">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="539.15" y="688.93" as="sourcePoint" />
            <mxPoint x="361.15" y="742.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-28" edge="1" parent="1" source="xjCEGFBqJN23oKtGqnzH-25" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" target="xjCEGFBqJN23oKtGqnzH-24">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="593.15" y="666.93" as="sourcePoint" />
            <mxPoint x="415.15" y="720.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-29" edge="1" parent="1" source="xjCEGFBqJN23oKtGqnzH-25" style="rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=0;exitY=0.5;exitDx=0;exitDy=0;endArrow=none;endFill=0;entryX=1;entryY=0.5;entryDx=0;entryDy=0;" target="xjCEGFBqJN23oKtGqnzH-22">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="669.15" y="671.93" as="sourcePoint" />
            <mxPoint x="491.15" y="725.93" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-34" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="14" width="150" x="127.30000000000001" y="511.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-32" parent="xjCEGFBqJN23oKtGqnzH-34" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="150" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-33" parent="xjCEGFBqJN23oKtGqnzH-34" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="150" y="7" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-37" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="14" width="150" x="322.29999999999995" y="511.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-35" parent="xjCEGFBqJN23oKtGqnzH-37" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="150" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-36" parent="xjCEGFBqJN23oKtGqnzH-37" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="150" y="7" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-40" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="14" width="150" x="517.3" y="511.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-44" connectable="0" parent="xjCEGFBqJN23oKtGqnzH-40" style="group" value="" vertex="1">
          <mxGeometry height="14" width="150" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-41" parent="xjCEGFBqJN23oKtGqnzH-44" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="150" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-42" parent="xjCEGFBqJN23oKtGqnzH-44" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="7" width="150" y="7" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-51" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="14" width="85.15" x="164" y="195.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-52" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="14" width="85.15" x="172" y="17" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-53" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="14" width="85.15" x="105.00000000000001" y="407.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-54" parent="1" style="whiteSpace=wrap;html=1;" value="" vertex="1">
          <mxGeometry height="14" width="85.15" x="151.15" y="565.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-55" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="0..*" vertex="1">
          <mxGeometry height="30" width="60" x="335.15" y="609.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-56" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="0..*" vertex="1">
          <mxGeometry height="30" width="60" x="400.15" y="647.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-57" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="1" vertex="1">
          <mxGeometry height="30" width="60" x="524.15" y="588.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-58" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="0..*" vertex="1">
          <mxGeometry height="30" width="60" x="505.15" y="661.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-59" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="1" vertex="1">
          <mxGeometry height="30" width="60" x="513.15" y="607.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-60" parent="1" style="text;html=1;whiteSpace=wrap;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;rounded=0;" value="1" vertex="1">
          <mxGeometry height="30" width="60" x="326.15" y="634.93" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-61" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="28" width="27" x="537.5034652863377" y="162.99701867693096" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-15" parent="xjCEGFBqJN23oKtGqnzH-61" style="shape=stencil(jZJhDoMgDIVPw0+NSnaAhW336LAqkYEBp+72Q9Fsoi5LCEm/17yWFkKZraBBkiUVoReSZWmcuNvFfRCDbZC3HnZgBNwlesW2RtfYi7ydPYSq0Ih2VOmVJGeXMx7KuFbKmQit7MRugX4HXpdGP1W+Eha5gbHCRljkh+7Ghwy+ibnt1xzFJx+HRdcWYPjHId13MEMIwgwJpsTIeUWFhHLVju0Rmy+c/tMVl9riYRZljm9GM9GDeVJWaIM/Bl0IKf1Wd9fkyMZgov4vTeAN);whiteSpace=wrap;html=1;rotation=-30;" value="" vertex="1">
          <mxGeometry height="28" width="27" as="geometry" />
        </mxCell>
        <mxCell id="api-users-circle" parent="xjCEGFBqJN23oKtGqnzH-61" style="ellipse;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;" value="" vertex="1">
          <mxGeometry height="20" width="20" x="3.4965347136622995" y="4.0029813230690365" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-62" connectable="0" parent="1" style="group" value="" vertex="1">
          <mxGeometry height="28" width="27" x="271" y="163" as="geometry" />
        </mxCell>
        <mxCell id="xjCEGFBqJN23oKtGqnzH-14" parent="xjCEGFBqJN23oKtGqnzH-62" style="shape=stencil(jZJhDoMgDIVPw0+NSnaAhW336LAqkYEBp+72Q9Fsoi5LCEm/17yWFkKZraBBkiUVoReSZWmcuNvFfRCDbZC3HnZgBNwlesW2RtfYi7ydPYSq0Ih2VOmVJGeXMx7KuFbKmQit7MRugX4HXpdGP1W+Eha5gbHCRljkh+7Ghwy+ibnt1xzFJx+HRdcWYPjHId13MEMIwgwJpsTIeUWFhHLVju0Rmy+c/tMVl9riYRZljm9GM9GDeVJWaIM/Bl0IKf1Wd9fkyMZgov4vTeAN);whiteSpace=wrap;html=1;rotation=15;" value="" vertex="1">
          <mxGeometry height="28" width="27" as="geometry" />
        </mxCell>
        <mxCell id="api-gates-circle" parent="xjCEGFBqJN23oKtGqnzH-62" style="ellipse;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;" value="" vertex="1">
          <mxGeometry height="20" width="20" x="3.5" y="4" as="geometry" />
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
