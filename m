Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155658;
	b=xtCXjad17WI243S11+zGqwhQUbg0rfl2l32PH8F/11LzANNeF6Hc0DvXcgnuJJCfYMl6
	 sT/x1/JVxNy0CP8jQGW0YNjNzBVpnJat5J6iGfEW6Liidh+fTVXwCbTYILCadMi/nNOxL
	 mzxnQzmU/Mt4NnGSkwpHqbVU91JINlGqzAkbT5GiTNiRUhN2tYtR1FfHSHcxGr/vZn0yE
	 yyYXXmknSF3TYWv/ukZiobLxlTCLT1JyEfSs6pjjYcxofQruJ8Prxt86hrvh5btNIXhgs
	 B5c3GoPa1Vj+J3cprvRR+83jqe+I2aD9IX7V9acwyk+Ir+LE08t/2aXFvYWe1NYqdWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155658;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Lo+fVHWcChqZEIrwZsqLJW74nkqPP9U6dQsGzgwbt9c=;
	b=YYYARrWF6VgRa5ZVOLTWEHAhTzewFz4c3T2azGkPKb3mnyIVSojtcLTXq4bsfnFCB+6k
	 ehHzLRtMoM5XwRCWyax1r/9oZlxgMfPS0YVJNkTGZzt+PlgfUxg1gQCaiBX37sEgFxsDi
	 qujUeBdBjH0Vi2ZS5Rx0ZKxF6qwIOpQWuBsdGPxEeP2syLSPKvGGRyTaR5k3sLWjzlQaz
	 Nby0fCcnVX4es2cnwpetbATPdkrmOXZ8a6+iMEjiKOO5kN+wUxCj2BotmWjiRhPjK7TyL
	 PCt0J+ybRtmVbvDjs3ZcORKe3qfziISaYkIPyMZRKSVtL9e9hJMp518eS20l3ch+LTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pyjN79tk;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B177560A2600
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 06:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B177560A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=pyjN79tk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=pyjN79tkiuyKIMvaxLNDzLZOEKfYiEtB4b+U90u78TbP7Vig6hpiMVHrvWPjIrKxsq5xtiMKwSpIh
	 nnxRbBNjReHPm0hobrtFtPzh7TTTbsfa/q+qZy6vttgEpuHNYOdIgVHM7sNmKWlJofxfAmWt8cPzfG
	 HDBBLtACtjINnMkQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86affe6c57ca-c4f31;
	Fri, 20 Nov 2026 14:20:54 +0800 (CST)
X-RM-TRANSID:2ee86affe6c57ca-c4f31
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26affe6c591f-187a3;
	Fri, 20 Nov 2026 14:20:54 +0800 (CST)
X-RM-TRANSID:2ee26affe6c591f-187a3
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: brgl@kernel.org
Cc: warthog618@gmail.com,
	linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] tools: gpio: Preserve device listing errors in lsgpio
Date: Fri, 20 Nov 2026 14:20:53 +0800
Message-ID: <20261120062053.98356-1-zhujun2@cmss.chinamobile.com>
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

When no chip is selected, lsgpio breaks out of the directory scan on a
list_device() failure, then unconditionally resets ret to zero. A chip
that cannot be opened or queried is therefore reported as success.

Initialize ret to zero before scanning instead, so an empty scan still
succeeds and errors from list_device() reach the caller.

Fixes: 6d591c46bce0 ("tools/gpio: create GPIO tools")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/gpio/lsgpio.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
index 52a0be45410c..de2eccc13479 100644
--- a/tools/gpio/lsgpio.c
+++ b/tools/gpio/lsgpio.c
@@ -205,7 +205,7 @@ int main(int argc, char **argv)
 			goto error_out;
 		}
 
-		ret = -ENOENT;
+		ret = 0;
 		while (ent = readdir(dp), ent) {
 			if (check_prefix(ent->d_name, "gpiochip")) {
 				ret = list_device(ent->d_name);
@@ -214,7 +214,6 @@ int main(int argc, char **argv)
 			}
 		}
 
-		ret = 0;
 		if (closedir(dp) == -1) {
 			perror("scanning devices: Failed to close directory");
 			ret = -errno;


