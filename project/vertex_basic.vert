#version 330

in vec3 position;
in vec3 normal;
in float voltage;

uniform mat4 projectionTransform;
uniform mat4 sceneTransform;
uniform mat4 modelTransform;

out float passVoltage;
out float passLightValue;

void main()
{
  gl_Position = projectionTransform * sceneTransform * modelTransform * vec4(position, 1.0);
  passLightValue = dot(normalize(sceneTransform * modelTransform * vec4(normal, 0.0)), vec4(0.0, 0.0, 1.0, 0.0));
  passVoltage = voltage;
}