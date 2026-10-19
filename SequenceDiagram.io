<mxfile host="app.diagrams.net" modified="2026-10-19T00:00:00.000Z" agent="OpenCode" version="24.0.0">
  <diagram name="Sequence Diagram" id="sequence-diagram">
    <mxGraphModel dx="900" dy="700" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="900" pageHeight="700" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />

        <!-- Lifelines -->
        <mxCell id="lifeline-client" value="Клиент" style="shape=umlLifeline;perimeter=lifelinePerimeter;whiteSpace=wrap;html=1;container=0;collapsible=0;recursiveResize=0;outlineConnect=0;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="80" y="40" width="100" height="600" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-auth" value="AuthAPI" style="shape=umlLifeline;perimeter=lifelinePerimeter;whiteSpace=wrap;html=1;container=0;collapsible=0;recursiveResize=0;outlineConnect=0;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="240" y="40" width="100" height="600" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-gates" value="GatesAPI" style="shape=umlLifeline;perimeter=lifelinePerimeter;whiteSpace=wrap;html=1;container=0;collapsible=0;recursiveResize=0;outlineConnect=0;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="400" y="40" width="100" height="600" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-db" value="БД" style="shape=umlLifeline;perimeter=lifelinePerimeter;whiteSpace=wrap;html=1;container=0;collapsible=0;recursiveResize=0;outlineConnect=0;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="560" y="40" width="100" height="600" as="geometry" />
        </mxCell>
        <mxCell id="lifeline-redis" value="Redis" style="shape=umlLifeline;perimeter=lifelinePerimeter;whiteSpace=wrap;html=1;container=0;collapsible=0;recursiveResize=0;outlineConnect=0;fillColor=#ffffff;strokeColor=#000000;fontStyle=1;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="720" y="40" width="100" height="600" as="geometry" />
        </mxCell>

        <!-- Messages -->
        <!-- 1. Аутентификация -->
        <mxCell id="msg1" value="1. POST /api/users/login(username, password)" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="100" as="sourcePoint" />
            <mxPoint x="290" y="100" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg2" value="2. Проверка пользователя в БД" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="290" y="130" as="sourcePoint" />
            <mxPoint x="610" y="130" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg3" value="3. Создание сессии в Redis" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="290" y="160" as="sourcePoint" />
            <mxPoint x="770" y="160" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg4" value="4. Установка cookie session_id" style="html=1;verticalAlign=bottom;endArrow=open;endFill=0;dashed=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="290" y="190" as="sourcePoint" />
            <mxPoint x="130" y="190" as="targetPoint" />
          </mxGeometry>
        </mxCell>

        <!-- 2. GET списка услуг -->
        <mxCell id="msg5" value="5. GET /api/gates(q, angle_x_min, angle_x_max, angle_y_min, angle_y_max)" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="230" as="sourcePoint" />
            <mxPoint x="450" y="230" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg6" value="6. SELECT * FROM gates WHERE status='published'" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="260" as="sourcePoint" />
            <mxPoint x="610" y="260" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg7" value="7. Список гейтов (items, total)" style="html=1;verticalAlign=bottom;endArrow=open;endFill=0;dashed=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="290" as="sourcePoint" />
            <mxPoint x="130" y="290" as="targetPoint" />
          </mxGeometry>
        </mxCell>

        <!-- 3. Добавление услуги -->
        <mxCell id="msg8" value="8. POST /api/gates(title, image, video)" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="330" as="sourcePoint" />
            <mxPoint x="450" y="330" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg9" value="9. INSERT INTO gates (status='draft')" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="360" as="sourcePoint" />
            <mxPoint x="610" y="360" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg10" value="10. gate_id" style="html=1;verticalAlign=bottom;endArrow=open;endFill=0;dashed=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="390" as="sourcePoint" />
            <mxPoint x="130" y="390" as="targetPoint" />
          </mxGeometry>
        </mxCell>

        <!-- 4. Получение черновика -->
        <mxCell id="msg11" value="11. GET /api/gates/draft" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="420" as="sourcePoint" />
            <mxPoint x="450" y="420" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg12" value="12. SELECT * FROM gates WHERE creator_id=user_id" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="450" as="sourcePoint" />
            <mxPoint x="610" y="450" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg13" value="13. Черновик гейта" style="html=1;verticalAlign=bottom;endArrow=open;endFill=0;dashed=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="480" as="sourcePoint" />
            <mxPoint x="130" y="480" as="targetPoint" />
          </mxGeometry>
        </mxCell>

        <!-- 5. Публикация -->
        <mxCell id="msg14" value="14. PUT /api/gates/{id}/publish(summary, angle_x, angle_y)" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="510" as="sourcePoint" />
            <mxPoint x="450" y="510" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg15" value="15. UPDATE gates SET status='published'" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="540" as="sourcePoint" />
            <mxPoint x="610" y="540" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg16" value="16. Опубликованный гейт" style="html=1;verticalAlign=bottom;endArrow=open;endFill=0;dashed=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="570" as="sourcePoint" />
            <mxPoint x="130" y="570" as="targetPoint" />
          </mxGeometry>
        </mxCell>

        <!-- 6. Лента -->
        <mxCell id="msg17" value="17. GET /api/gates/feed" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="130" y="600" as="sourcePoint" />
            <mxPoint x="450" y="600" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg18" value="18. SELECT * FROM gates WHERE status='published'" style="html=1;verticalAlign=bottom;endArrow=block;endFill=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="630" as="sourcePoint" />
            <mxPoint x="610" y="630" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="msg19" value="19. Лента гейтов" style="html=1;verticalAlign=bottom;endArrow=open;endFill=0;dashed=1;fontSize=9;" edge="1" parent="1">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="450" y="660" as="sourcePoint" />
            <mxPoint x="130" y="660" as="targetPoint" />
          </mxGeometry>
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>