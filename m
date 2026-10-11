Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6995C3164BA
	for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791712896; cv=none; b=MfgT8wvMw3OL7xHaG2H/AyZTWeb+7hfktG9c43XQJKnbTyELjGdhuSOR/cfJ3gL392jQCxfaBCO8YeiFFL08lxfW2BQ6fK7UtS3dNQmE6NG7/JQ+7PQ4+eIaU/sHnQiQR0HPdvQL6a1npyIU+5sHbQWc7Y0Ck9FMDXeDVlo2m/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791712896; c=relaxed/simple;
	bh=hoKMSRawjwQBbwpZtC9X3vWBG8ZONIPpWs0BiloPsr8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N3y2x3tFlS4h0EPLsAJbETPBuXOeaDJGGhMTtoIMSnR7jjFyLxZPe8mkW5WysK4UcL0q9f+iNJYUXIv3MN3rKE0vMD9JH9lAJAiHzLu/cwDX4NNTVtM8XZ32hYUSnjmoveZedb4KeCyKpQ2RiVkfuRzuC61yKkxwMuzTWYRT68E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tD5pSQxy; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tD5pSQxy"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afe75f055so956056f8f.2
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2026 03:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791712892; x=1792317692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ADLgzzd+rEg7irK6OecpBoNcXr584HXbUOk26+seFz8=;
        b=tD5pSQxyzFxMNYoVzRQuiPSWNXbfD/4O/Ga27lstMMezEAC7D2368KDYErtpM7jI/h
         Y0pRo7JXlgOZqYXirCvLjM0pI7x8Isr8slV7inuoEqRa+HFeyQHTRxpmaZ9yJsxwYnaS
         NTG2D8oTZylOx51uWum5WSvkwEFmMtLvxeMpFh0eBQFSjgtoXm8WEQENwfxMhn40wzWh
         wCel+cf4w/gPeybdi7yDxUF0CJBeXts86is1CwQpahoKpzqfFuw+Hy8U/+q+7BKZ4Gh5
         m2Zcl+jd1XbGj4CY/wDubWSZcBhVQZA3xofxm2ij835+L1gQxtuRizM1kzcN1G7yGCmY
         uXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791712892; x=1792317692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ADLgzzd+rEg7irK6OecpBoNcXr584HXbUOk26+seFz8=;
        b=kkPA2gFwuCvYFxaydbEDFZu8c7uYwAPwLgajI1TraB+ErD6ylcu7nugWhEsNNt0NaV
         Rp9kZP42BEEcbPaaw9evEjYBeS5adq5Me/DWQfEkcWkqr4CsX7BN2TlhT/H8mZi4ZcqH
         dR8W9+tAzmQpGS9I19hJDaznRZZ6ptquhX66gIN5DEGQIyG9K0/roEvvTMqbh9EAKFrd
         noU+3xwpp47RVsxAkCMtgIgekhmII6J1UAdNU2uZsPfnV+NU3qHtMGq0+18NAHxp7+kM
         vXxgoFFnGVwYtamM7EiZeuGxpFiMbZKDqeG467n5Xxe1R4/1fde0IscaCxtqFqxGTeGA
         TQgA==
X-Gm-Message-State: AFq9FYIWb4YOOcNt3C9GmxPA+8FghFyZiY3KQ90d4A1GHcnM0EBtcw2K
	Oa834nCUVk0uMTVTELc6ST8faanfcj6zA/bRYe7aKON7oiEDJ1cUVU6gE3Vr7R/y
X-Gm-Gg: AYBFou0KHBGXNRBKhY4Y75PjvT/Uchk/xKt3osVmllgoRc/2FRJW7CAhTSZ+9mk5FA6
	0oiy204QcJlAnjl7Wh6qGEgStSeAh42XcLMwAT8E1fqWgyIqYe+qPtjhLGorQJU8Dop8RWb7KfL
	eRNJgO2F/5Cr1zuIhC6TGXEiG0cfk2jLlkszBndGlzJRHqi2tLbN8xIjTQh3/3Tob3hde3ZchFW
	ZtPig3+etYuB2+kZQUOYVGBAIOhZA2YmA9Te9pZSvYTHQdzJq8R7tMo4REqm2qf7AlqhyT7rv0A
	YmA9xdMrNwqb9renrJTASWLaKwY+5wywCbr6EsNKIbTAJ4JNB/K5xvhki8l41xppBsTKpxMieU2
	CySjpvzD8GCsQrxirEIF6Xx6EbYJVM0PcYRFb9a7WKW79Xs3IdDi2zthi/p4daz4Z485NXWHYIl
	SVteiexQ8pA/otzE2ZO/ZnQQf/99+HNso1mL+v37D0ppvCOAG9fJIZ0eOVNmNsYvsg3VXKkN+g
X-Received: by 2002:a05:6000:4552:b0:48c:7ee3:e091 with SMTP id ffacd0b85a97d-48dba7893fbmr7140329f8f.8.1791712892041;
        Sun, 11 Oct 2026 03:01:32 -0700 (PDT)
Received: from pc-21jvcto1ww.lan ([158.181.1.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9aac57fsm13884292f8f.23.2026.10.11.03.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 03:01:31 -0700 (PDT)
From: tornilua@gmail.com
To: linux-gpio@vger.kernel.org
Cc: Ilya Kulaev <tornilua@gmail.com>
Subject: [libgpiod][PATCH] treewide: replace malloc() and memset() with calloc()
Date: Sun, 11 Oct 2026 16:00:59 +0600
Message-ID: <20261011100059.29832-1-tornilua@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ilya Kulaev <tornilua@gmail.com>

Replace malloc() followed by memset() with a single calloc()
call where zero-initialized memory is needed.

This reduces boilerplate without changing the intended behavior.

Link: https://github.com/brgl/libgpiod/issues/154
Signed-off-by: Ilya Kulaev <tornilua@gmail.com>
---
 lib/chip-info.c         |  4 +---
 lib/chip.c              |  4 +---
 lib/edge-event.c        |  3 +--
 lib/info-event.c        |  3 +--
 lib/line-config.c       |  4 +---
 lib/line-info.c         |  4 +---
 lib/line-request.c      |  4 +---
 lib/request-config.c    |  4 +---
 tests/gpiosim/gpiosim.c | 13 ++++---------
 tools/gpiotools.c       |  4 +---
 10 files changed, 13 insertions(+), 34 deletions(-)

diff --git a/lib/chip-info.c b/lib/chip-info.c
index 972b2a8..786b8b5 100644
--- a/lib/chip-info.c
+++ b/lib/chip-info.c
@@ -45,12 +45,10 @@ gpiod_chip_info_from_uapi(struct gpiochip_info *uapi_info)
 {
 	struct gpiod_chip_info *info;
 
-	info = malloc(sizeof(*info));
+	info = calloc(1, sizeof(*info));
 	if (!info)
 		return NULL;
 
-	memset(info, 0, sizeof(*info));
-
 	info->num_lines = uapi_info->lines;
 
 	/*
diff --git a/lib/chip.c b/lib/chip.c
index 611eb32..8e210b4 100644
--- a/lib/chip.c
+++ b/lib/chip.c
@@ -33,12 +33,10 @@ GPIOD_API struct gpiod_chip *gpiod_chip_open(const char *path)
 	if (fd < 0)
 		return NULL;
 
-	chip = malloc(sizeof(*chip));
+	chip = calloc(1, sizeof(*chip));
 	if (!chip)
 		goto err_close_fd;
 
-	memset(chip, 0, sizeof(*chip));
-
 	chip->path = strdup(path);
 	if (!chip->path)
 		goto err_free_chip;
diff --git a/lib/edge-event.c b/lib/edge-event.c
index be46dce..779af1f 100644
--- a/lib/edge-event.c
+++ b/lib/edge-event.c
@@ -99,11 +99,10 @@ gpiod_edge_event_buffer_new(size_t capacity)
 	if (capacity > EVENT_BUFFER_MAX_CAPACITY)
 		capacity = EVENT_BUFFER_MAX_CAPACITY;
 
-	buf = malloc(sizeof(*buf));
+	buf = calloc(1, sizeof(*buf));
 	if (!buf)
 		return NULL;
 
-	memset(buf, 0, sizeof(*buf));
 	buf->capacity = capacity;
 
 	buf->events = calloc(capacity, sizeof(*buf->events));
diff --git a/lib/info-event.c b/lib/info-event.c
index 0e3ef9b..8b456e8 100644
--- a/lib/info-event.c
+++ b/lib/info-event.c
@@ -20,11 +20,10 @@ gpiod_info_event_from_uapi(struct gpio_v2_line_info_changed *uapi_evt)
 {
 	struct gpiod_info_event *event;
 
-	event = malloc(sizeof(*event));
+	event = calloc(1, sizeof(*event));
 	if (!event)
 		return NULL;
 
-	memset(event, 0, sizeof(*event));
 	event->timestamp = uapi_evt->timestamp_ns;
 
 	switch (uapi_evt->event_type) {
diff --git a/lib/line-config.c b/lib/line-config.c
index f00892e..34414b9 100644
--- a/lib/line-config.c
+++ b/lib/line-config.c
@@ -36,12 +36,10 @@ GPIOD_API struct gpiod_line_config *gpiod_line_config_new(void)
 {
 	struct gpiod_line_config *config;
 
-	config = malloc(sizeof(*config));
+	config = calloc(1, sizeof(*config));
 	if (!config)
 		return NULL;
 
-	memset(config, 0, sizeof(*config));
-
 	return config;
 }
 
diff --git a/lib/line-info.c b/lib/line-info.c
index 1613c92..0bf1a38 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -141,12 +141,10 @@ gpiod_line_info_from_uapi(struct gpio_v2_line_info *uapi_info)
 	struct gpiod_line_info *info;
 	size_t i;
 
-	info = malloc(sizeof(*info));
+	info = calloc(1, sizeof(*info));
 	if (!info)
 		return NULL;
 
-	memset(info, 0, sizeof(*info));
-
 	info->offset = uapi_info->offset;
 	strncpy(info->name, uapi_info->name, GPIO_MAX_NAME_SIZE);
 	info->name[GPIO_MAX_NAME_SIZE] = '\0';
diff --git a/lib/line-request.c b/lib/line-request.c
index 32ab9ae..2720d69 100644
--- a/lib/line-request.c
+++ b/lib/line-request.c
@@ -29,12 +29,10 @@ gpiod_line_request_from_uapi(struct gpio_v2_line_request *uapi_req,
 		return NULL;
 	}
 
-	request = malloc(sizeof(*request));
+	request = calloc(1, sizeof(*request));
 	if (!request)
 		return NULL;
 
-	memset(request, 0, sizeof(*request));
-
 	request->chip_name = strdup(chip_name);
 	if (!request->chip_name) {
 		free(request);
diff --git a/lib/request-config.c b/lib/request-config.c
index cd22028..923c9e7 100644
--- a/lib/request-config.c
+++ b/lib/request-config.c
@@ -18,12 +18,10 @@ GPIOD_API struct gpiod_request_config *gpiod_request_config_new(void)
 {
 	struct gpiod_request_config *config;
 
-	config = malloc(sizeof(*config));
+	config = calloc(1, sizeof(*config));
 	if (!config)
 		return NULL;
 
-	memset(config, 0, sizeof(*config));
-
 	return config;
 }
 
diff --git a/tests/gpiosim/gpiosim.c b/tests/gpiosim/gpiosim.c
index 920edb4..80b2da0 100644
--- a/tests/gpiosim/gpiosim.c
+++ b/tests/gpiosim/gpiosim.c
@@ -559,11 +559,10 @@ GPIOSIM_API struct gpiosim_ctx *gpiosim_ctx_new(void)
 	if (ret)
 		return NULL;
 
-	ctx = malloc(sizeof(*ctx));
+	ctx = calloc(1, sizeof(*ctx));
 	if (!ctx)
 		return NULL;
 
-	memset(ctx, 0, sizeof(*ctx));
 	refcount_init(&ctx->refcnt, ctx_release);
 
 	ret = ctx_get_configfs_fd(ctx);
@@ -623,7 +622,7 @@ GPIOSIM_API struct gpiosim_dev *gpiosim_dev_new(struct gpiosim_ctx *ctx)
 	if (configfs_fd < 0)
 		goto err_unlink;
 
-	dev = malloc(sizeof(*dev));
+	dev = calloc(1, sizeof(*dev));
 	if (!dev)
 		goto err_close_fd;
 
@@ -632,7 +631,6 @@ GPIOSIM_API struct gpiosim_dev *gpiosim_dev_new(struct gpiosim_ctx *ctx)
 	if (ret)
 		goto err_free_dev;
 
-	memset(dev, 0, sizeof(*dev));
 	refcount_init(&dev->refcnt, dev_release);
 	list_init(&dev->banks);
 	list_init(&dev->deferred_banks);
@@ -920,12 +918,10 @@ GPIOSIM_API struct gpiosim_bank *gpiosim_bank_new(struct gpiosim_dev *dev)
 	if (configfs_fd < 0)
 		goto err_unlink;
 
-	bank = malloc(sizeof(*bank));
+	bank = calloc(1, sizeof(*bank));
 	if (!bank)
 		goto err_close_cfs;
 
-	memset(bank, 0, sizeof(*bank));
-
 	refcount_init(&bank->refcnt, bank_release);
 	list_add(&bank->siblings, &dev->banks);
 	bank->cfs_dir_fd = configfs_fd;
@@ -1017,7 +1013,7 @@ static int bank_make_line_dir(struct gpiosim_bank *bank, unsigned int offset)
 	if (ret && errno != ENOENT)
 		return -1;
 
-	line = malloc(sizeof(*line));
+	line = calloc(1, sizeof(*line));
 	if (!line)
 		return -1;
 
@@ -1027,7 +1023,6 @@ static int bank_make_line_dir(struct gpiosim_bank *bank, unsigned int offset)
 		return -1;
 	}
 
-	memset(line, 0, sizeof(*line));
 	line->offset = offset;
 	list_add(&line->siblings, &bank->lines);
 
diff --git a/tools/gpiotools.c b/tools/gpiotools.c
index dda36da..48ba5ea 100644
--- a/tools/gpiotools.c
+++ b/tools/gpiotools.c
@@ -153,12 +153,10 @@ gpiotools_resolver_init(int num_lines, char **lines, int num_chips,
 	int i;
 
 	resolver_size = sizeof(*resolver) + num_lines * sizeof(*line);
-	resolver = malloc(resolver_size);
+	resolver = calloc(1, resolver_size);
 	if (!resolver)
 		return NULL;
 
-	memset(resolver, 0, resolver_size);
-
 	resolver->chips = calloc(num_chips,
 				 sizeof(struct gpiotools_resolved_chip));
 	if (!resolver->chips) {
-- 
2.56.0

