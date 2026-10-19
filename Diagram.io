<mxfile host="app.diagrams.net" modified="2026-10-19T00:00:00.000Z" agent="OpenCode" version="24.0.0">
  <diagram name="ER Diagram" id="er-diagram">
    <mxGraphModel dx="800" dy="600" grid="1" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="800" pageHeight="600" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />

        <!-- Users Table -->
        <mxCell id="users-table" value="users" style="swimlane;fontStyle=1;align=center;verticalAlign=top;childLayout=stackLayout;horizontal=1;startSize=25;horizontalStack=0;resizeParent=1;resizeParentMax=0;resizeLast=0;collapsible=1;marginBottom=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="40" y="40" width="180" height="120" as="geometry" />
        </mxCell>
        <mxCell id="users-id" value="PK  id : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="users-table">
          <mxGeometry y="25" width="180" height="20" as="geometry" />
        </mxCell>
        <mxCell id="users-username" value="    username : VARCHAR(64)" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="users-table">
          <mxGeometry y="45" width="180" height="20" as="geometry" />
        </mxCell>
        <mxCell id="users-email" value="    email : VARCHAR(128)" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="users-table">
          <mxGeometry y="65" width="180" height="20" as="geometry" />
        </mxCell>
        <mxCell id="users-password" value="    password : VARCHAR(128)" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="users-table">
          <mxGeometry y="85" width="180" height="20" as="geometry" />
        </mxCell>

        <!-- Gates Table -->
        <mxCell id="gates-table" value="gates" style="swimlane;fontStyle=1;align=center;verticalAlign=top;childLayout=stackLayout;horizontal=1;startSize=25;horizontalStack=0;resizeParent=1;resizeParentMax=0;resizeLast=0;collapsible=1;marginBottom=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="300" y="40" width="200" height="200" as="geometry" />
        </mxCell>
        <mxCell id="gates-id" value="PK  id : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="25" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-title" value="    title : VARCHAR(128)" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="45" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-summary" value="    summary : VARCHAR(512) [nullable]" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="65" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-status" value="    status : VARCHAR(16)" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="85" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-image-url" value="    image_url : VARCHAR(255)" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="105" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-video-url" value="    video_url : VARCHAR(255)" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="125" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-angle-x" value="    angle_x : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="145" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-angle-y" value="    angle_y : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="165" width="200" height="20" as="geometry" />
        </mxCell>
        <mxCell id="gates-creator-id" value="FK  creator_id : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="gates-table">
          <mxGeometry y="185" width="200" height="20" as="geometry" />
        </mxCell>

        <!-- Likes Table -->
        <mxCell id="likes-table" value="likes" style="swimlane;fontStyle=1;align=center;verticalAlign=top;childLayout=stackLayout;horizontal=1;startSize=25;horizontalStack=0;resizeParent=1;resizeParentMax=0;resizeLast=0;collapsible=1;marginBottom=0;whiteSpace=wrap;html=1;fillColor=#ffffff;strokeColor=#000000;fontSize=10;" vertex="1" parent="1">
          <mxGeometry x="560" y="40" width="180" height="100" as="geometry" />
        </mxCell>
        <mxCell id="likes-id" value="PK  id : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="likes-table">
          <mxGeometry y="25" width="180" height="20" as="geometry" />
        </mxCell>
        <mxCell id="likes-user-id" value="FK  user_id : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="likes-table">
          <mxGeometry y="45" width="180" height="20" as="geometry" />
        </mxCell>
        <mxCell id="likes-gate-id" value="FK  gate_id : INTEGER" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontSize=9;" vertex="1" parent="likes-table">
          <mxGeometry y="65" width="180" height="20" as="geometry" />
        </mxCell>

        <!-- Relationships (straight lines) -->
        <mxCell id="rel-users-gates" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="users-table" target="gates-table">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-users-likes" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="users-table" target="likes-table">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>
        <mxCell id="rel-gates-likes" value="" style="endArrow=block;endFill=1;startArrow=block;startFill=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" edge="1" parent="1" source="gates-table" target="likes-table">
          <mxGeometry relative="1" as="geometry" />
        </mxCell>

      </root>
    </mxGraphModel>
  </diagram>
</mxfile>