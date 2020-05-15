pkg load control

b = [1,0,-1];
a = [1,0,-0.49];

g = tf(b,a)

figure(1)
bode(g,'k')
print("bode.png","-S1080,720")

figure(2)
margin(g,'k')
print("margin.png","-S1080,720")