Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794782509;
	b=OnnOLzat5VZ1s8FktaVpFcolKRYjL91Qv9nmQQK8OqqbqN8XOfkkowD5I92LnM/2lNzS
	 yZLzD1AuNajLBpeM19TZ7uBfnxl0ZFr8CYixp9Cq7hSRbMXXqeb4t+um+IiOUNMWQcOAG
	 lGVxBxYUaVuNReNAfEDFd6dPRutOzxltvJKYmdwbN5+TDmxEpV+bsSv8kyv1e3mo4rcsy
	 +J/Mm1Iemh08V8UaJeyV4h4J9kgeyvq2zo18VuqQQZf/FKGOLVCeRppGEF5qpRTcpP8Ot
	 XEzu9q+NOkzxciMl0w1xoJ0qdEHdKie1Hes8aYwqFXM6DmpcUt/fqIUQJLrBFvwDBCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794782509;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
	b=bLj3TEkX0GVImGLcDrPh8Y0UBnu5tm6f5RuaSreQpM3JBXRXoPgbaqVsRNnNMtYs1mDo
	 4JbxBBOlMkxZ1FG22+OEVPDy7f6lamQY/DT7ixXw/TY9whNOSvMfWenXOtILa/PJMVbZp
	 oWlPM6guijrK5v4S7JmwRWYbDum1ce4R/Sz27Ezw8c/5abk8ZcMasCHe7asyP63dwWnSu
	 TzB2iWJxcz6fsvWHuoCrekk9iPet3W48Q4uuDd45rL0eVWxSf9hHCXI6atlhBUvYLTUyG
	 5ovVeN274z7Cv9Fou69bkQhkpHHZFBOmWWtgaWfn6C1+yd4Ev1dcTNglOa9zCfDyr/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=googlemail.com;
	spf=pass smtp.mailfrom=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YqlKnmP9;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5441C606A329
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 22:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5441C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YqlKnmP9
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3111139f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 14:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794782507; x=1795387307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=YqlKnmP9Dt1t0tpESqS+QrXrCH6dCwC6uOCahDkEqVEYJ/t0nlZZ6yS4kRgC860WgB
         Yo9zJvsFjM+9d5FL97dA4em0dGvPvGH0yHW2i/ytqt6llgDZSKGZ7aYKDY+9XY2yiSFL
         kdTEcRVka75alK7uYr7Swa3jZ7mQi0seFwBTfKZ4T6Xo8w8NZNwec9Mp58XeXhFv6EZt
         aLRW9yBHOwhFDxlCpsCjbsYJqR8iLJVxo//kFMS7zYaBlD2Lu7L4Ho42HSmIUQRMwved
         i6e2BY4ooeVl3E0fXESSFMOdvs+0GzAobSodwR+1E0SuvVr39/pwN9qni3dYDk4Tio6y
         w5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782507; x=1795387307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=KIzO8gN2AOON81DbOJpZfDxJYX00M6IENLZSoY+5PwryLPlZk8G+ivmsLmYnQHWrH4
         nk74yFhj2sEAIUrg1ItuNc9dFl9W0DSBbzbR40d6sA0UJqjnuh29ki+wrfj7mSSRTe0d
         I2eLFslCQV1w218rmWwhFqwO1x7Ty8Y4AqbhIVAMnHA8xCy/DADp9wjSxTji+tUZCVVh
         iFmcvLSVg3Z2MxGy2e1gUh1mXqydabPsmrs7fqom6/fxAJUpBgmW41zJXLGGXc8X+cma
         wct01zJiSqdTQ9tT/PTfP8C5EeYxhb3ePAeNaYblNTVI5kNoX0OsyAtM/umYZuLxPQQz
         Ih7Q==
X-Forwarded-Encrypted: i=1; AL+hErHwH1Oc678sGKAZTUV2YRQx2UEhF1E60wZLlx+HV5tdS131FihWt2o/o3XV2G0zPLnLtfAVwJdzpUMu@vger.kernel.org
X-Gm-Message-State: APuU4Z+7M5wIYXd0W7TjmCo0tVSex2CUnI1dynjYsdQO41YflvXRqAZK
	Vrs+Fs3bUmB3g6slQqtSCbIOyMLcYlENGffOiC8rfSPqJX4Gt7aYLe3M
X-Gm-Gg: AYBFou0cdgZ/zpWBX0LXE8XXSOYVvt+FZhrgsHQzcCEGz6Avv/2pPgArvhX0ZcOjxzZ
	WmlnHrdwPuwjOZveX1XxX+YIVGhW7fjqsZzMfk1FV4WNpVVxz5xZHau+XDT5IeubxIaWhiMOcVv
	uO6Cazq5txmYaokb2QVaas6PU+A7NZMfeDHxud2GMrIqgDAMrYNMqh+bVZW0l9Xraj7m42v4dj2
	eZFoihp1+ydJ6fbFsKmSkaQIoeJ1OTyh3SKsybNkUwGVpWAhdxGdRZ1dMAMT2pnyhGnIkzrUq68
	OcFpwnIickRvW0UFzb7dFlebaJyHlA4PVVlAyr7ZkPZa9bAQhTorZaS1cGtO8frcgdxPpasNz7l
	5ICmpmHpjvEx86itschO1SnLIUSEl9WJ76aUAH2y3/mPSmvJmLpfwl7DFXCMdOo/NWSicYr+7/Z
	GbKr5mleswWgu9mRd/If/WJtHP9lavV6atGtSlEJGcQsiuEJuea88jP6c566sGuoW9VbbJien1S
	e1ddN8GwTUEYrL3ozaO/p0IFwPb3oHr8EL1GZ7cJFLar2hQ/wMe3YoNhUTjJyRxLmCkJxjBKgJW
	o6Fn6vor4f4hfmIlOrHiqgUx/pF3ElxADkLo5hASb2lq5NAKs4O+K23U1wqI8mZdEA0Wt4u1psh
	r9oZdsuV+KsdOfHVTg0mNSMe0pQh8DqwMR0I5zhB1wEugr+O+SMGT1ss=
X-Received: by 2002:a05:6000:3108:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-49c711b7ee1mr19686269f8f.21.1794782507434;
        Sun, 15 Nov 2026 14:41:47 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-9c24-a600-021b-21ff-fe38-46c2.310.pool.telefonica.de. [2a02:3100:9c24:a600:21b:21ff:fe38:46c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5fe373casm17986572f8f.30.2026.11.15.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:41:46 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linusw@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
Date: Sun, 15 Nov 2026 23:41:36 +0100
Message-ID: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2S pin groups are registered without the _pins suffix, but the
i2s_groups array still references them with the _pins suffix.
Update the group names so that the I2S pin groups can be referenced.

Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 3da7f3799c3f..1f58752637a3 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
 };
 
 static const char * const i2s_groups[] = {
-	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
-	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
-	"i2s_am_clk_pins", "i2s_out_ch78_pins"
+	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
+	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
+	"i2s_am_clk", "i2s_out_ch78"
 };
 
 static const char * const sd_c_groups[] = {
-- 
2.56.1

