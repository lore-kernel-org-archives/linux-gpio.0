Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189223A6EFA
	for <linux-gpio@vger.kernel.org>; Wed, 29 Apr 2026 07:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777448655; cv=none; b=KqE+Xu1VVFQQprYAcT3jqew7tGMq4/G34undhgFykzmPZXjO0lnEl6rPqyJg9Auc1z8jkonYv/Oa2QQwvj66IZLtQA5ucA2qWa7ghNRwUii96rb77vmDH/pfxYlb9ucXWqa9rhp0R9yRXAH4bru+7nTY752XBmVxP1aKVo1WVX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777448655; c=relaxed/simple;
	bh=Rec6tKdlrPie2YlW6IezIVTsdvPBR7mcFyVSswWMX0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h5JmYF1MctMOwOoIhpkryuv8++Wo2/StJMrL6vddh2++FeI0G/GOT9JaQvq2oZa9vTkzdMsEMijE+3Y3WlodOo2GFz/Fc9AxH2yQ3dWSfqZSXM8RtwVNveIm1Nur7nAo12EPrYG6m6StEu+RKKUrC7svJZDw+ofA6y1BfH1EvKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PIJvxGis; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PIJvxGis"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B95AF4E42B68;
	Wed, 29 Apr 2026 07:44:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8D29A601DF;
	Wed, 29 Apr 2026 07:44:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F4C6107294F3;
	Wed, 29 Apr 2026 09:44:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777448650; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=bwLke4Yv7KiuA2B/0DRghtp6oBFzx2igNOWj+w+dOh0=;
	b=PIJvxGisdsGvAzSxK2T43Bmz8JUXirJtXhy7qRFGf6maQ8Kj2NLVxMwQ3xvjoGjHgZGFiB
	MrWY/QzEGDVqBcCDazRX1pA5blLqwEakIYLgOfcpq6i3Zz+y1YuPIqc3jsGG43RPHo7v5M
	Q0bdSIrHLkzQtxPN/uTJfS6lV8U7/0pDf/Z30w2kMHBjYtGTeruZVjUGloJ3TROn/1kSQ0
	zCqWggh31i/fHtzeIXhtGEXAJW5rYluUuUW1+USNnRa4IxCTUYGiqOQqiMSVX3AEKwhtA6
	J507UAVZBa2f2EdtoYlvXgWAtOAN03mspjS/f4o9XKC2l7gwmfiRf9BmqviZGA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 01/17] of: Introduce of_property_read_s32_index()
Date: Wed, 29 Apr 2026 09:43:37 +0200
Message-ID: <20260429074356.118420-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260429074356.118420-1-herve.codina@bootlin.com>
References: <20260429074356.118420-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Signed integers can be read from single value properties using
of_property_read_s32() but nothing exist to read signed integers
from multi-value properties.

Fix this lack adding of_property_read_s32_index().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 include/linux/of.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index 959786f8f196..28153616e616 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1476,6 +1476,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 	return of_property_read_u32(np, propname, (u32*) out_value);
 }
 
+static inline int of_property_read_s32_index(const struct device_node *np,
+					     const char *propname, u32 index,
+					     s32 *out_value)
+{
+	return of_property_read_u32_index(np, propname, index, (u32 *)out_value);
+}
+
 #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
 	for (of_phandle_iterator_init((it), (np), (ln), (cn), (cc)),	\
 	     err = of_phandle_iterator_next(it);			\
-- 
2.53.0

