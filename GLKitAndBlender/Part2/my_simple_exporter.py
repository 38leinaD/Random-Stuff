import bpy
import os

# Change if file should be written some place else
file = open(os.path.expanduser("~/Desktop/mymodel.mdl"), "w")

model_object = None
model_mesh = None

# Search for the first object of type MESH
for obj in bpy.context.scene.objects:
    if obj.type == 'MESH':
        model_object = obj
        model_mesh = obj.data

# Triangulate
model_object.select = True
bpy.ops.object.mode_set(mode='EDIT')
bpy.ops.mesh.select_all(action='SELECT')
bpy.ops.mesh.quads_convert_to_tris()

for face in model_mesh.faces:
    for vertex_index in face.vertices:
        vertex = model_mesh.vertices[vertex_index]
        # Write each vertex in a seperate line with x,y,z seperated by a tab
        file.write(str(vertex.co[0]))
        file.write('\t')
        file.write(str(vertex.co[1]))
        file.write('\t')
        file.write(str(vertex.co[2]))
        file.write('\n')