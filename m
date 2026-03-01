Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBA1DF271;
	Sun,  1 Mar 2026 01:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329684; cv=none; b=hWzUB8hN3k/HSCRY62aSWbZGGn9Zl+7fQAqk2RfgIMESdeNOMY42amwF4XjZMI/9RwmG2LsMHydeUwmHiZwgTn8iwdFTCqWGuHmwUlhBzfr6Hv5D0H9pB3BBjiYgksnuxxO/AAEi5yyxiiFgyLzuKB8SBS0VsFX/bNI+tRYWG2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329684; c=relaxed/simple;
	bh=JrWbP3fELqkbnS4evjeP6AG4b1SvK6Lbx4N7QcHReZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bcUIT1haXgak+6FLK+uetwR/4YR7799TY/Cw3KiKQD+yA6oplajwI4q3Z3wNSQs25DKvQIIA3WoReLeOFSrh9yn9VVWWYI2eXxU+BNbu26+Crce/v6aoDszhzMhyXHXViupQyQFq2hJPK/3yU/LrusgHX6bMayvwrd6LFC7FreM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SGxvYWFa; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SGxvYWFa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=m0lUQVjB4bz4gYr4KdrrqOoFFRkfq9A/pDpjL29dHYo=; b=SGxvYWFanX0ii/S7Eq1oZ3NSCs
	0CtFqt0Gl+JUATbMJmjHGH+LCgdA0xFB5Ami7OvS+DSt5OYbkcnPgngOqCNfNHMLMfJm3XNNXOEkw
	W1oz+8fd9Ei8S1gGzn2bdfsqxxQbliOikaAwWmlKIjhQ/No2XMovrJtsjtJ6MIpWkLu/STM+JL/2x
	78tECsOkDgW8bfm6dSjmCbKr+ojHk9Nhgmn3U6xVfK2aJZ2TAejjyc0bszLm2QPOh/R29lcfYs8m3
	OI/vfH/aaY6LkdQ36U09bv4GFN9wNHcxXG/YyMVMu+qM1xoPHluTe0Y0lBOQmCJUVpbFmzqW5QtTM
	ny6/4idQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwVuc-0000000AePY-2TkE;
	Sun, 01 Mar 2026 01:48:02 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org
Subject: [PATCH] pinctrl: pinconf-generic: fix an enum name description
Date: Sat, 28 Feb 2026 17:48:02 -0800
Message-ID: <20260301014802.3133231-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct an enum name in a kernel-doc comment to avoid kernel-doc
warnings:

Warning: include/linux/pinctrl/pinconf-generic.h:161 Enum value
 'PIN_CONFIG_SKEW_DELAY_OUTPUT_PS' not described in enum 'pin_config_param'
Warning: include/linux/pinctrl/pinconf-generic.h:161 Excess enum value
 '@PIN_CONFIG_SKEW_DELAY_OUPUT_PS' description in 'pin_config_param'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org

 include/linux/pinctrl/pinconf-generic.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260227.orig/include/linux/pinctrl/pinconf-generic.h
+++ linux-next-20260227/include/linux/pinctrl/pinconf-generic.h
@@ -115,7 +115,7 @@ struct pinctrl_map;
  * @PIN_CONFIG_SKEW_DELAY_INPUT_PS: if the pin has independent values for the
  *	programmable skew rate (on inputs) and latch delay (on outputs), then
  *	this parameter specifies the clock skew only. The argument is in ps.
- * @PIN_CONFIG_SKEW_DELAY_OUPUT_PS: if the pin has independent values for the
+ * @PIN_CONFIG_SKEW_DELAY_OUTPUT_PS: if the pin has independent values for the
  *	programmable skew rate (on inputs) and latch delay (on outputs), then
  *	this parameter specifies the latch delay only. The argument is in ps.
  * @PIN_CONFIG_SLEEP_HARDWARE_STATE: indicate this is sleep related state.
