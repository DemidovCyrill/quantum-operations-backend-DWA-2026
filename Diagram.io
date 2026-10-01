<mxfile host="app.diagrams.net" agent="OpenCode">
  <diagram name="ER Diagram" id="er-diagram">
    <mxGraphModel dx="1192" dy="539" grid="0" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="0" pageScale="1" pageWidth="1169" pageHeight="827" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="users-table" parent="1" style="swimlane;fontStyle=1;align=center;verticalAlign=top;childLayout=stackLayout;horizontal=1;startSize=30;horizontalStack=0;resizeParent=1;resizeParentMax=0;resizeLast=0;collapsible=1;marginBottom=0;whiteSpace=wrap;html=1;" value="users" vertex="1">
          <mxGeometry height="180" width="280" x="80" y="80" as="geometry" />
        </mxCell>
        <mxCell id="users-id" parent="users-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="id : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="30" as="geometry" />
        </mxCell>
        <mxCell id="users-id-pk" parent="users-table" style="text;strokeColor=none;fillColor=none;align=center;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;fontStyle=1" value="PK" vertex="1">
          <mxGeometry y="30" as="geometry" />
        </mxCell>
        <mxCell id="users-username" parent="users-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="username : VARCHAR(64)" vertex="1">
          <mxGeometry height="30" width="280" y="60" as="geometry" />
        </mxCell>
        <mxCell id="users-email" parent="users-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="email : VARCHAR(128)" vertex="1">
          <mxGeometry height="30" width="280" y="90" as="geometry" />
        </mxCell>
        <mxCell id="users-created-at" parent="users-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="created_at : TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="280" y="120" as="geometry" />
        </mxCell>
        <mxCell id="gates-table" parent="1" style="swimlane;fontStyle=1;align=center;verticalAlign=top;childLayout=stackLayout;horizontal=1;startSize=30;horizontalStack=0;resizeParent=1;resizeParentMax=0;resizeLast=0;collapsible=1;marginBottom=0;whiteSpace=wrap;html=1;" value="gates" vertex="1">
          <mxGeometry height="360" width="280" x="480" y="210" as="geometry" />
        </mxCell>
        <mxCell id="gates-id" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="id : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="30" as="geometry" />
        </mxCell>
        <mxCell id="gates-title" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="title : VARCHAR(128)" vertex="1">
          <mxGeometry height="30" width="280" y="60" as="geometry" />
        </mxCell>
        <mxCell id="gates-summary" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="summary : VARCHAR(512)" vertex="1">
          <mxGeometry height="30" width="280" y="90" as="geometry" />
        </mxCell>
        <mxCell id="gates-status" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="status : VARCHAR(16)" vertex="1">
          <mxGeometry height="30" width="280" y="120" as="geometry" />
        </mxCell>
        <mxCell id="gates-image-url" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="image_url : VARCHAR(255)" vertex="1">
          <mxGeometry height="30" width="280" y="150" as="geometry" />
        </mxCell>
        <mxCell id="gates-video-url" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="video_url : VARCHAR(255)" vertex="1">
          <mxGeometry height="30" width="280" y="180" as="geometry" />
        </mxCell>
        <mxCell id="gates-angle-x" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="angle_x : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="210" as="geometry" />
        </mxCell>
        <mxCell id="gates-angle-y" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="angle_y : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="240" as="geometry" />
        </mxCell>
        <mxCell id="gates-creator-id" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="creator_id : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="270" as="geometry" />
        </mxCell>
        <mxCell id="gates-created-at" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="created_at : TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="280" y="300" as="geometry" />
        </mxCell>
        <mxCell id="gates-formed-at" parent="gates-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="formed_at : TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="280" y="330" as="geometry" />
        </mxCell>
        <mxCell id="likes-table" parent="1" style="swimlane;fontStyle=1;align=center;verticalAlign=top;childLayout=stackLayout;horizontal=1;startSize=30;horizontalStack=0;resizeParent=1;resizeParentMax=0;resizeLast=0;collapsible=1;marginBottom=0;whiteSpace=wrap;html=1;" value="likes" vertex="1">
          <mxGeometry height="150" width="280" x="880" y="95" as="geometry" />
        </mxCell>
        <mxCell id="likes-id" parent="likes-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="id : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="30" as="geometry" />
        </mxCell>
        <mxCell id="likes-user-id" parent="likes-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="user_id : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="60" as="geometry" />
        </mxCell>
        <mxCell id="likes-gate-id" parent="likes-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="gate_id : INTEGER" vertex="1">
          <mxGeometry height="30" width="280" y="90" as="geometry" />
        </mxCell>
        <mxCell id="likes-created-at" parent="likes-table" style="text;strokeColor=none;fillColor=none;align=left;verticalAlign=middle;spacingLeft=4;spacingRight=4;overflow=hidden;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;rotatable=0;whiteSpace=wrap;html=1;" value="created_at : TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="280" y="120" as="geometry" />
        </mxCell>
        <mxCell id="rel-users-gates" edge="1" parent="1" source="users-table" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="gates-table" value="1:N">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="400" y="170.06" />
              <mxPoint x="400" y="390.06" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-users-likes" edge="1" parent="1" source="users-table" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="likes-table" value="1:N">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="880" y="170.06" />
            </Array>
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-gates-likes" edge="1" parent="1" source="gates-table" style="edgeStyle=orthogonalEdgeStyle;rounded=0;orthogonalLoop=1;jettySize=auto;html=1;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;" target="likes-table" value="1:N">
          <mxGeometry relative="1" as="geometry">
            <Array as="points">
              <mxPoint x="820" y="390.06" />
              <mxPoint x="820" y="170.06" />
              <mxPoint x="880" y="170.06" />
            </Array>
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
