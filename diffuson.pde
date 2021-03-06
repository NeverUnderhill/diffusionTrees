ArrayList<PVector> generateParticles(int n) {
    ArrayList<PVector> particles = new ArrayList<PVector>(); 
    for (int i = 0; i < n; ++i) {
        particles.add(new PVector(random(width * 0.45, width * 0.55), random(0, height * 0.25)));
    }
    return particles;
}

void drawPoint(PVector p, float radius) {
    fill(50);
    ellipse(p.x, p.y, radius, radius);
}

void drawParticles(ArrayList<PVector> particles) {
    background(0);
    noStroke();
    for (PVector p : particles) {
        if (p != null) {
            drawPoint(p, 4);      
        }
    }
}

void updateParticles(ArrayList<PVector> particles, float variance) {
    for (PVector p: particles) {
        if (p == null) {
            continue;
        }
        float dx = randomGaussian(0, variance);
        float dy = randomGaussian(0, variance);
        if (p.x + dx > 0 && p.x + dx < width) {
            p.x += dx;
        }
        if (p.y + dy > 0 && p.y + dy < height) {
            p.y += dy;
        }
    }
}