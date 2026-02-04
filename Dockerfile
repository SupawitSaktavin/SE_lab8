FROM jenkins/jenkins:lts

USER root

# -------------------------
# Install system dependencies
# -------------------------
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    chromium \
    chromium-driver \
    fonts-liberation \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libxss1 \
    libasound2 \
    libgbm1 \
    libdrm2 \
    libxshmfence1 \
    libu2f-udev \
    ca-certificates \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# -------------------------
# Create Python virtual environment for Robot
# -------------------------
RUN python3 -m venv /opt/robot-venv && \
    /opt/robot-venv/bin/pip install --no-cache-dir \
        robotframework \
        robotframework-seleniumlibrary \
        selenium

# -------------------------
# Make venv default
# -------------------------
ENV PATH="/opt/robot-venv/bin:$PATH"

# -------------------------
# Chrome env
# -------------------------
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROMEDRIVER_BIN=/usr/bin/chromedriver

USER jenkins
