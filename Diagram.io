<mxfile host="Electron" agent="OpenCode">
  <diagram name="ER Diagram Crow&#39;s Foot" id="er-diagram-crowfoot">
    <mxGraphModel dx="1015" dy="607" grid="0" gridSize="10" guides="1" tooltips="1" connect="1" arrows="1" fold="1" page="1" pageScale="1" pageWidth="1200" pageHeight="800" math="0" shadow="0">
      <root>
        <mxCell id="0" />
        <mxCell id="1" parent="0" />
        <mxCell id="users-header" parent="1" style="shape=table;startSize=30;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;fillColor=#ffffff;strokeColor=#000000;fontSize=12;" value="users" vertex="1">
          <mxGeometry height="150" width="285" x="136" y="78" as="geometry" />
        </mxCell>
        <mxCell id="users-row-1" parent="users-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="30" as="geometry" />
        </mxCell>
        <mxCell id="users-row-1-key" parent="users-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;fontStyle=1;overflow=hidden;fontSize=12;" value="PK" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-1-name" parent="users-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="id" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-1-type" parent="users-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-2" parent="users-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="60" as="geometry" />
        </mxCell>
        <mxCell id="users-row-2-key" parent="users-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-2-name" parent="users-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="username" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-2-type" parent="users-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="VARCHAR(64)" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-3" parent="users-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="90" as="geometry" />
        </mxCell>
        <mxCell id="users-row-3-key" parent="users-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-3-name" parent="users-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="email" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-3-type" parent="users-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="VARCHAR(128)" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-4" parent="users-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="120" as="geometry" />
        </mxCell>
        <mxCell id="users-row-4-key" parent="users-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-4-name" parent="users-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="created_at" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="users-row-4-type" parent="users-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-header" parent="1" style="shape=table;startSize=30;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;fillColor=#ffffff;strokeColor=#000000;fontSize=12;" value="gates" vertex="1">
          <mxGeometry height="360" width="285" x="485" y="215" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-1" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="30" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-1-key" parent="gates-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;fontStyle=1;overflow=hidden;fontSize=12;" value="PK" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-1-name" parent="gates-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="id" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-1-type" parent="gates-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-2" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="60" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-2-key" parent="gates-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-2-name" parent="gates-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="title" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-2-type" parent="gates-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="VARCHAR(128)" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-3" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="90" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-3-key" parent="gates-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-3-name" parent="gates-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="summary" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-3-type" parent="gates-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="VARCHAR(512)" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-4" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="120" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-4-key" parent="gates-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-4-name" parent="gates-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="status" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-4-type" parent="gates-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="VARCHAR(16)" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-5" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="150" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-5-key" parent="gates-row-5" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-5-name" parent="gates-row-5" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="image_url" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-5-type" parent="gates-row-5" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="VARCHAR(255)" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-6" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="180" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-6-key" parent="gates-row-6" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-6-name" parent="gates-row-6" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="video_url" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-6-type" parent="gates-row-6" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="VARCHAR(255)" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-7" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="210" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-7-key" parent="gates-row-7" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-7-name" parent="gates-row-7" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="angle_x" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-7-type" parent="gates-row-7" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-8" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="240" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-8-key" parent="gates-row-8" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-8-name" parent="gates-row-8" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="angle_y" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-8-type" parent="gates-row-8" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-9" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="270" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-9-key" parent="gates-row-9" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;fontStyle=2;overflow=hidden;fontSize=12;" value="FK" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-9-name" parent="gates-row-9" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="creator_id" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-9-type" parent="gates-row-9" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-10" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="300" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-10-key" parent="gates-row-10" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-10-name" parent="gates-row-10" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="created_at" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-10-type" parent="gates-row-10" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-11" parent="gates-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="285" y="330" as="geometry" />
        </mxCell>
        <mxCell id="gates-row-11-key" parent="gates-row-11" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-11-name" parent="gates-row-11" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="formed_at" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="gates-row-11-type" parent="gates-row-11" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="105" x="180" as="geometry">
            <mxRectangle height="30" width="105" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-header" parent="1" style="shape=table;startSize=30;container=1;collapsible=0;childLayout=tableLayout;fixedRows=1;rowLines=0;fontStyle=1;align=center;resizeLast=1;fillColor=#ffffff;strokeColor=#000000;fontSize=12;" value="likes" vertex="1">
          <mxGeometry height="150" width="267" x="830" y="78" as="geometry" />
        </mxCell>
        <mxCell id="likes-row-1" parent="likes-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="267" y="30" as="geometry" />
        </mxCell>
        <mxCell id="likes-row-1-key" parent="likes-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;fontStyle=1;overflow=hidden;fontSize=12;" value="PK" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-1-name" parent="likes-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="id" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-1-type" parent="likes-row-1" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="87" x="180" as="geometry">
            <mxRectangle height="30" width="87" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-2" parent="likes-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="267" y="60" as="geometry" />
        </mxCell>
        <mxCell id="likes-row-2-key" parent="likes-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;fontStyle=2;overflow=hidden;fontSize=12;" value="FK" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-2-name" parent="likes-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="user_id" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-2-type" parent="likes-row-2" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="87" x="180" as="geometry">
            <mxRectangle height="30" width="87" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-3" parent="likes-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="267" y="90" as="geometry" />
        </mxCell>
        <mxCell id="likes-row-3-key" parent="likes-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;fontStyle=2;overflow=hidden;fontSize=12;" value="FK" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-3-name" parent="likes-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="gate_id" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-3-type" parent="likes-row-3" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="INTEGER" vertex="1">
          <mxGeometry height="30" width="87" x="180" as="geometry">
            <mxRectangle height="30" width="87" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-4" parent="likes-header" style="shape=tableRow;horizontal=0;startSize=0;swimlaneHead=0;swimlaneBody=0;fillColor=none;collapsible=0;dropTarget=0;points=[[0,0.5],[1,0.5]];portConstraint=eastwest;fontSize=12;top=0;left=0;right=0;bottom=1;" value="" vertex="1">
          <mxGeometry height="30" width="267" y="120" as="geometry" />
        </mxCell>
        <mxCell id="likes-row-4-key" parent="likes-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="" vertex="1">
          <mxGeometry height="30" width="60" as="geometry">
            <mxRectangle height="30" width="60" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-4-name" parent="likes-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="created_at" vertex="1">
          <mxGeometry height="30" width="120" x="60" as="geometry">
            <mxRectangle height="30" width="120" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="likes-row-4-type" parent="likes-row-4" style="shape=partialRectangle;connectable=0;fillColor=none;top=0;left=0;bottom=0;right=0;overflow=hidden;fontSize=12;" value="TIMESTAMP" vertex="1">
          <mxGeometry height="30" width="87" x="180" as="geometry">
            <mxRectangle height="30" width="87" as="alternateBounds" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-users-gates" edge="1" parent="1" source="users-header" style="edgeStyle=entityRelationEdgeStyle;endArrow=ERmany;startArrow=ERone;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;fontSize=12;" target="gates-header" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="380" y="160" as="sourcePoint" />
            <mxPoint x="440" y="160" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-users-gates-label" connectable="0" parent="rel-users-gates" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];fontSize=12;" value="1:N" vertex="1">
          <mxGeometry relative="1" x="-0.2" y="2" as="geometry">
            <mxPoint x="10" y="-10" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-users-likes" edge="1" parent="1" source="users-row-1" style="edgeStyle=entityRelationEdgeStyle;endArrow=ERmany;startArrow=ERone;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;fontSize=12;" target="likes-row-1" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="380" y="160" as="sourcePoint" />
            <mxPoint x="800" y="160" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-users-likes-label" connectable="0" parent="rel-users-likes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];fontSize=12;" value="1:N" vertex="1">
          <mxGeometry relative="1" x="-0.2" y="2" as="geometry">
            <mxPoint x="10" y="-10" as="offset" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-gates-likes" edge="1" parent="1" source="gates-header" style="edgeStyle=entityRelationEdgeStyle;endArrow=ERmany;startArrow=ERone;exitX=1;exitY=0.5;exitDx=0;exitDy=0;entryX=0;entryY=0.5;entryDx=0;entryDy=0;fontSize=12;" target="likes-row-2" value="">
          <mxGeometry relative="1" as="geometry">
            <mxPoint x="740" y="160" as="sourcePoint" />
            <mxPoint x="800" y="160" as="targetPoint" />
          </mxGeometry>
        </mxCell>
        <mxCell id="rel-gates-likes-label" connectable="0" parent="rel-gates-likes" style="edgeLabel;html=1;align=center;verticalAlign=middle;resizable=0;points=[];fontSize=12;" value="1:N" vertex="1">
          <mxGeometry relative="1" x="-0.2" y="2" as="geometry">
            <mxPoint x="10" y="-10" as="offset" />
          </mxGeometry>
        </mxCell>
      </root>
    </mxGraphModel>
  </diagram>
</mxfile>
