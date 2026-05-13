Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777F385D72
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660250; cv=none; b=tEGjhe+O+ntiAqSPHH64i7UPQ3XXwfzZKXx2i/J+3TrDWvXPsG2lWDuUJzoqacKD7Re7nIDgsE9nC1aBUjyausxINFJwBmAyu85stwcF6p7wOqgLgy2tTnNyPGiWtUhUCpxietz4AB7TH6AAMwdnPzGLeJSXzZECgzV1g6iXsvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660250; c=relaxed/simple;
	bh=aQKpuKeLWGzs0rc2yJxJsWgIw5xsY6mHoRbEI75011I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpKdaeLXVYwmJQFuaxrVwcwGs9z8cX/HVFBug2x0EfjgQ+r+oOnRYaic9lKuAgUU6uH7dIHY7PsC9+nWn6TIfe9OTh4Rw/Hvdi3Rz4yExtAOnCo71h6TmesBu/f1BrL7lv+5eCHSAn9CTgYlZvOILw+IhjrAt4GTsnT9ppnPnmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2ofK1yqG; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2ofK1yqG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 81A761A3597;
	Wed, 13 May 2026 08:17:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5233B606CE;
	Wed, 13 May 2026 08:17:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F69E11AF8790;
	Wed, 13 May 2026 10:17:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1778660241; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=hL78oEbudOSFeol+ORqqQXKroRRxjS7rg6+ZdehjJvI=;
	b=2ofK1yqGhUwRj/frLcXVD4KQryIOeXSH/I75l5cLQEb0EZQfPJsp2TVt3LWdbfwBza+rym
	/HP7m+0ID6Q8FUDy4UFf2kO1h1DMvPsfRTju6ALQZ1fuGnGCsf301+eKqpbvKlwY30Yclh
	IRjIToaBG7CsF7IFvxSArSPPpDGCgvzQqbZ6Mt+H9mUM606RVstQPltMKiDUcgHTszdGNr
	Q6kLCNfv5MH5aAf4gFczka/Os7zr6snePj++N7MsYvPStGPBn43NNCY4suyVETugoNXJWE
	T0nC/VAaWw8kQD6BI9llRzJ6Vyy5ZUrQz0fzutCYvecFbdkMQQaAnMpzAu8SKw==
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
Subject: [PATCH v3 01/17] of: Introduce of_property_read_s32_index()
Date: Wed, 13 May 2026 10:16:45 +0200
Message-ID: <20260513081702.317117-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
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
2.54.0

