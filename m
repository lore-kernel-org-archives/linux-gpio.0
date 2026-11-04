Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793648;
	b=0pP5luAND40jPFh7ZKdFnEkslUHORVqAKMgFoA7BP0pom+VtfcTlEDF+6aZ2YYhfuBfA
	 3Bn8MvDsgFHkE/so/KMxqBRW+/tOj4haay7B7r6DBt7b1cyVs8TPvNVtq0KtXpcnXpsgh
	 H988QYRZKwT/iDpSJsIluQd1dA4diDsASZ++/vvLXnFDTMETjMLZHnYsaB+UBKx8XDAbO
	 VLdtMEKnHZ1lxHArWSg6/9RHoIIqqZPYk5ghp+BL64OPn2Ygy/vPrACwCTox+bWEng/qx
	 dsMYCJ+WyJ+cq3q42Eaj0cXFmjBHQqGlzcaapYck+juLMw/tW/PZnGUQgW7rkKmkw2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYYdYQNG26JelqH/bO6Y/sAG4udZyz280WGQYCnp+Vc=;
	b=UFH+qaDHxTuJWLDRAwFPLZxD9udiKWX2xnk/UXarfUVpRwf5zmCG7gkTK6SutD1wa0BP
	 sg3GkjAG2Gl1vc9vD9lyeO6LSFP9U86rCBSD8PRXigxB3Ddduq9qXbV8NbJP5UGmUu1EC
	 KwubAYTt8oSxfR1nrNVnWiTq5/TG+hPycDzOwGf+JJ0Kdl7mUcTTXVQoH4d/vFRRuAmbT
	 9ubNN61lOwMEovXpfUfu7oQfxVNco5o2XA7/0gRR5hxC99iRGeW8aWTqYJNpV6FtAkrpg
	 U8W8OPoErvk3bb128Z7MVDxtxCJOcMkeVYTHgr42TpR2hSk313jhnZOdaTkrf5JmULw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t48QjAGz;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A887606A326
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A887606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t48QjAGz
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ac7842c17dso455335a91.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 04:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793793647; x=1794398447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYYdYQNG26JelqH/bO6Y/sAG4udZyz280WGQYCnp+Vc=;
        b=t48QjAGzYaPjbtIuzNJMlbDCnYhXw5XG9mNIENxSGhZGqHpY0u2fC2BMMj2tIQazOF
         8sKro+KCHE6kstWc8/7+osjzuIfJM+4HQNniUsTCs6EX9bycoCDL2j/v4hBUKn92xUxr
         dI0GSUoVjzwQSzQ/b8CnPeudW91Q4YCHE4G9dQcUWwVREExnSOsCyFac+22CWJtSWv4g
         emyzVPdzvcadcY2+g0keA50gpd0Tr1te1FDmRgJr0kna0rytNkseOXrt9wZgfKANZF40
         CwaKPDOZrEA1rjYQjo9jObUgvUStvSpEQ8gDcv67wQgb9ekKe3C8F7iCBWixpoS0VUhz
         eRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793793647; x=1794398447;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYYdYQNG26JelqH/bO6Y/sAG4udZyz280WGQYCnp+Vc=;
        b=q3kMX6dAACtmXLJN+jFXQP97s02U7xkqADP6N+nmmDJGkW3ohomkHeSO1fUFq4GMJO
         LFf6chiDeZC5737pIonfS08+HfzY0O0gsckXIxjbnIMYcqflPNZQGHe52OSB1kqMTwng
         f1END2jGbW9++UwYUcx4GV0h3UuBpXauv1bkOus5YmT/NnbMI8WgR3zB3BYKXIPRzpDM
         aZq/sqjPym2wOX4/x2+jSu1hdidkHbAAd53P4GYVwDPywhToV/L7bpNiQhqZHAx3NaC1
         7JAApIgyYebHcokD6pwD1++CdXZS/YvR3i/K1cXAqoIcbGXPye7MGc29AjPm0W+53S2m
         AFXw==
X-Forwarded-Encrypted: i=1; AKwUvBxUS40aVupC9na2AveFq6p140HhJOpaAg7SL6lVp73wF5w7lyV90LSqxI5sUj7DdkzIr/UTueSp/86J@vger.kernel.org
X-Gm-Message-State: APuU4Z9x/R77t71qmszBrvupO1+08ZaXrUAxh7Fu1IsVtbi1PsdyVylH
	2JsBTTXVdyTWbqPkUz6gk40PqP1T7NMdYtk91dNhM35gDTfPwzbOWCST
X-Gm-Gg: AYBFou0iYxzVMo2qwduUdBNf2E3jIotzc9VcMTz5bZvswM5bwdGqP/vTfCkiCT0JpfV
	CVVAdLbhI7x0F6mbYz649R7HsgjF3n4zKwJUMmic7nVTs0eeZ7lfqXJb3kx6ferHGzRhC5Oy1TO
	7nIxARpg4S5phN+IjWtbKJRXAv7x7xHLErv/GIv2vRr60hEmsgzFwU6Q3pHp0vU+5VM9s7GIHGM
	fYduoU1FQ2mYjFDzkSd1GF4nU53U6zIMjnkrhGBEoyxTLbZYHv/NKUteSM4ruHA1UTmSZP6Wyv4
	MTkwMbvUQOPNalCO4bmS74gKXQj0wck8X76n/dv2NRs5fPhz3IeKUJ4Izc61ZDh9ndCzDi7V+T3
	h8ucn0ONmgv7h3g7wt46yxE6u02AlBHVE147zTYEBd62fREvpK/z+dsp53bLGL7BZF26opAUJ3O
	IsEjdCbgb7aauHZ4L7sb/CAfy4jhNxYYiOFLdX2ttogjRZPZliRsaXpJXIY3GZzLuO/o0VMIzpG
	QT28Wz2Pr9ab+0kHeHiBMsw4sBxZVWQpGbRAUv5hI6jqvrKVD17VaNNde4KoGQ2FQWnzV4eZv0I
	3viN80UoQ9ZAkKH0wB/sheoPVZfQcVONFBUi7hQS34mJC+4zfNhBGWlZLh538CmsepidWuy4po2
	elsqUr2hOI5gcJ3avfrwhz9wD8a4Q9kbIJu0iNHAuG6kLwyLhWPlOSf6KZ0ofyZDK8JzYJvLaAB
	Q=
X-Received: by 2002:a17:90b:4a83:b0:3ac:8af9:4a73 with SMTP id 98e67ed59e1d1-3ae89747a06mr12116049a91.28.1793793645910;
        Wed, 04 Nov 2026 04:00:45 -0800 (PST)
Received: from localhost.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b093d481a3sm3835932a91.1.2026.11.04.04.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:00:45 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: brgl@kernel.org
Cc: linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpiolib: reset lookup flags for each hogged line
Date: Wed,  4 Nov 2026 20:59:38 +0900
Message-ID: <20261104115938.226-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
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

gpiochip_add_hog() initializes lflags once before iterating over the GPIO
specifiers. In the non-OF path, an active-low line sets GPIO_ACTIVE_LOW,
but a later active-high line does not clear it. A single firmware hog
with mixed polarities therefore configures later active-high lines as
active-low, including inverting their initial output value.

Initialize the lookup flags for each line before translating its flags.
The OF helper already overwrites the flags for each specifier; the
non-OF path must also start with a fresh value.

Codex assisted with identifying the issue and developing the fix.

Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
Changes in v2:
- Split the functional fix from its KUnit regression test as requested.
- Keep only the lookup-flag reset in gpiolib.c for gpio/for-current.
- Move build/runtime details out of the permanent commit message.

Target: brgl/linux gpio/for-current at c2d0710318b8cd57d0ef6088d0ee4bbc1e827fd3.
The KUnit test is sent separately for the v7.5 development cycle.

Testing on this target: actual UML/KUnit, before 8 pass / 1 fail;
after 9 pass / 0 fail, with the same config and test source.
GCC W=1 and Clang W=1/private Sparse C=2 builds completed.
No physical GPIO or runtime OF hardware validation was performed.

Previous version: https://lore.kernel.org/linux-gpio/20261103224339.1180-1-kimjinseob88@gmail.com/
Review: https://lore.kernel.org/linux-gpio/qboynvhfmvltsuopwotpf3sqdwho3qobxmw5qldooedjqodfgy@x4l6hscj5unx/

 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f2..db613770d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -975,7 +975,6 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	 */
 	u32 cells = 2;
 
-	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	dflags = GPIOD_ASIS;
 	name = NULL;
 
@@ -1014,6 +1013,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
 	for (unsigned int i = 0; i < num_hogs; i++) {
+		lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+
 		if (is_of_node(fwnode)) {
 			/*
 			 * OF-nodes need some additional special handling for

base-commit: c2d0710318b8cd57d0ef6088d0ee4bbc1e827fd3
