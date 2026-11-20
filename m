Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155672;
	b=w0PX7K+7a6xEzIFafOEMi37He7+1XS868JWa1gSo7gUOlQ+49K0sbB/MXN3wYeSgf42M
	 ilAmqR1SjTbo6BBmpk9oQTtIEP8X06U9674SBHoMX+S6z7Uinl9COUFNl3JO4d7usKk69
	 1Fn06xyW4ppbh3J3w8ZGwzAiLnTAdeUv8SX1x+Ms6VIVU5nzB4oGgNy3Tw3s5g7zMVxZ9
	 DntfVGgkXtr/8KPu/F0RBcE/u13yK5sQupZ3268rsA4AMBBiNaf+0t3lolW7Tr75AMSJw
	 ChZMBW3z2y7NMf58M/WlRBQS25G9LYuPYhjJRMNsQZbww8eyFlZq6JyfsxX0ePG+kcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155672;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bOKP7U6NI9/0LEErNaTWcG3dFZJIS6YAz7SCxnK3RtU=;
	b=ZYFxeiDmMxxzuPoZWTgZiEXK7B+Cyzl87HXxIg3pUul+MJOplRePxjSimV8rF7gXtKF7
	 jnkUt4I83ZZDkZFGVsNfm+Rd0po4KRowxpyhHeEuhbQON9ref2cgVouPSj+ohC0/IQMWH
	 ONTeWIvYrIZDmNQ0CneBjdE6Gt7ym0qrgpAH0DlbyXP5r+Qut3AItPoIBt+pkiNogo384
	 O5FQ4N/dtzrrEVUOtkkMqBDQbKqi2f1RL0HY9mPcqI858NAuJrnhw9v1TgmzYjhrhSr4w
	 gDK2seR6aTKxvJOBxMu2Ku5cBVQ1quQEo1oB/DnmpSUjJ5gAQXobQ+0xjbDLMiOy5nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=p8+1aHud;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 903FB60A2605
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 06:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 903FB60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=p8+1aHud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=p8+1aHud/ITo7R450QUrs51rbhR4gVpWgaCKRsn6E1W+zcIZZRIPIGvI4ZuIhvXYBSBmwP1h/EkNb
	 PXtxPxwP33f5U2uduvyx6YudApAINoABUPgoLYqg9vzLcLP0onkfDAMh0kfWTvFaBRu67kY5F2necL
	 uvpBpwEaJ68Ma6vU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86affe6d37d6-c4f3d;
	Fri, 20 Nov 2026 14:21:08 +0800 (CST)
X-RM-TRANSID:2ee86affe6d37d6-c4f3d
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee66affe6d39c8-1887c;
	Fri, 20 Nov 2026 14:21:08 +0800 (CST)
X-RM-TRANSID:2ee66affe6d39c8-1887c
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: brgl@kernel.org
Cc: warthog618@gmail.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] tools: gpio: Return success after monitoring requested events
Date: Fri, 20 Nov 2026 14:21:07 +0800
Message-ID: <20261120062107.98391-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
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

After reading the requested number of events, monitor_device() returns
the positive byte count left in ret by read(). main() passes this value
through as the exit status, so a successful invocation with -c reports
failure.

Clear ret when the event limit is reached, keeping read failures on their
existing error paths.

Fixes: 97f69747d8b1 ("tools/gpio: add the gpio-event-mon tool")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/gpio/gpio-event-mon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index b70813b0bf8e..af223e254bc9 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -124,8 +124,10 @@ int monitor_device(const char *device_name,
 		fprintf(stdout, "\n");
 
 		i++;
-		if (i == loops)
+		if (i == loops) {
+			ret = 0;
 			break;
+		}
 	}
 
 exit_line_close:


