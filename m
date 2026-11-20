Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155514;
	b=xRJ0GgqQgEXjfT1Cw2kKhC9GmwlHwhG5WzbDiVwr/PYYWniBmkat/5Sxbx8wyQof/oOQ
	 QNIbavk7JkKy9o3cQ6u86c/7q9h/hJVc9N35sbG5hW3jsoaYOJ4QhEx1hwICXSE4lsU9h
	 zekeIKOnLkoBYj1B/rTLKrX1206wRUZ+8Rqs4WmJ6DBUlVkS1MqUQuGfKaMFkp4nW4ISq
	 896XYzZSUJhNYRBjqILZ/9BANQY+mZtN9agfiag1Z22KvBU+KvsFwrTMC1Sd+w9IX24mB
	 ijsc0cQ6CSmskxZTXLSoMbMhX3XhB22Dcc05Rp0cm5K4KfN4uP38IkKg3+v3isozYBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155514;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=G7b4O3gT/lWEaAkDMZEU6I6TSYJyJtxjTZkD3XmdeCo=;
	b=Zv7w6lXEprn+K4iM7rhGqQdAj3usu2FG6zkiA2KRDz/UswRzsVfnATwLPMGVNcs2V30q
	 rZuUrvr5rBt9iqPWC1N2j3FAuQXxHFdu3tGVSm/lP5v6yqOOlHPVyD+YzThz6XaJVbRiG
	 Y2OvC3gtGfc09wxUsDXWhncGxoW5gIjfTsgtrcAWMT9fJXcSRaeejboGg0uzB7+YZGSuu
	 uPG45PtpExzbq0fp9egGnS6RN5DL7ugT3nXknaxn+cZCD3dwfeFG/7hNRgp0pV0FlmDpM
	 jyoSaHyvgOABmnUJw+CPjcwx0/1jJCSYMcujtzC6HSIJIeYvKyhNjgMyn7jvpJOaD/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jjCnK01w;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1C3606A50A;
	Fri, 20 Nov 2026 06:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F1C3606A50A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=jjCnK01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=jjCnK01w3FBSCVsmKPHleCw5ublCgXcYmvSxcz0Giadz30jMzE+d8Pww4DB8XiAOlNslYQw2AfQXM
	 rtIh72n3KB+H65/PVcE3ly8kPx8yt/59RIMVT1PlcOn9O4BUT5ujP5YmTqI21rYaBZ0SCE1HfKr8NN
	 bEQkpFy3Ne81AF/0=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16affe63501b-00bef;
	Fri, 20 Nov 2026 14:18:29 +0800 (CST)
X-RM-TRANSID:2ee16affe63501b-00bef
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16affe63345d-182f9;
	Fri, 20 Nov 2026 14:18:29 +0800 (CST)
X-RM-TRANSID:2ee16affe63345d-182f9
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: brgl@kernel.org
Cc: warthog618@gmail.com,
	gabravier@gmail.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] tools: gpio-hammer: Accept the maximum number of line offsets
Date: Fri, 20 Nov 2026 14:18:27 +0800
Message-ID: <20261120061827.98066-1-zhujun2@cmss.chinamobile.com>
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

The offset count is incremented for every -o option, but the final
check rejects the maximum itself and reports one extra offset. Only
reject counts above the maximum and report the actual count.

Fixes: d1ee7e1f5c91 ("tools: gpio-hammer: Avoid potential overflow in main")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/gpio/gpio-hammer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 1a21e5460242..df6f71e48c59 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -159,10 +159,10 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (i >= GPIOHANDLES_MAX) {
+	if (i > GPIOHANDLES_MAX) {
 		fprintf(stderr,
 			"Only %d occurrences of '-o' are allowed, %d were found\n",
-			GPIOHANDLES_MAX, i + 1);
+			GPIOHANDLES_MAX, i);
 		return -1;
 	}
 


