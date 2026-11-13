Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794542266;
	b=3YpppL7STGFkZT6hoBzxiaTBdTutOL4+ssMcyIa54vB9/BOpPOOv3w9rrFuIeTOvRHn8
	 ruG07FxCrlsk4qEbyCmmeUXp7CCKrdWUNOoSUccWH7yq5oE3/FgndYM4Ns9Hu3qCFhybB
	 BAymlFsLYyomleUZUyHzkZVtGZ8quyWskEFyIFmRWJ/F5HJ8n9A8/f72j+hlpqLSTsRgS
	 TMGsYWH3N4kKy5YshOnk7j9ROoaIz9D8kcD65mgbcFFnGl0lZlEI4iBdmNPwzWgG6Py8S
	 2ZFGHa6uQCfDkeicHtcvq2yd4O37sOOcOXgEnBLBNbisfuabIqmNMi6NvlXUgabSmsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794542266;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=a5RpNGnH6HbfX261zNHh57A0eHINOsfNFlw+S5s3mTQ=;
	b=kpaiGB4R+Suaw9T+/6EBs2s5DL87KHc7452Q88T+G1lSj4RToXViEQJCLyQDXrreOJ7m
	 m+2Rxru77Gt1OLoV+bmArG8XBURWu7TzsNoa2QZxUhubXLq32MJuofK3fccD7P6CvR+TY
	 hImcfJkV4wMfPNBQdjGxAYxX+ar9Pli8ApvK5AdQlvYtim2+RtTpYI/XHXevO0IdB22oh
	 8oA69Y4boPUwJOT/mr7oK3CzW8Cm8imZFkqPGCWdDdHBiOu24V6ivJeJZGRufArdTESvl
	 5FlAqwf6Yo7guk1Z8athCjhxgwQj/YXMYMStNKFCTzRVnW+Vq7sUOPzj+nnRbSvjvBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tBWQTZdj;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F23606A31C;
	Fri, 13 Nov 2026 03:57:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8F23606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=tBWQTZdj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=tBWQTZdj25NNFWh6dfUj0wKzRCCo04gY/ARIl7VXg9+pLJM8NaLBenlPmCfPN26RDM8PYnrU/87Pl
	 PCMXwfidzeWG+T4WPlA0qL2jX3uREsMvYawUbYo5OSkv5AwSKk8HZQJ6AjcgU/xSvCxia6p0X8edq+
	 0BpJhObjbZJiQeDI=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af68aac4f1-874f4;
	Fri, 13 Nov 2026 11:57:34 +0800 (CST)
X-RM-TRANSID:2ee46af68aac4f1-874f4
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from FHB-W5100250 (unknown[36.137.216.21])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af68aa6e89-16873;
	Fri, 13 Nov 2026 11:57:34 +0800 (CST)
X-RM-TRANSID:2eea6af68aa6e89-16873
From: Gu Bin <gubin@cmss.chinamobile.com>
To: brgl@kernel.org
Cc: warthog618@gmail.com,
	andriy.shevchenko@linux.intel.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] tools: gpio: gpio-watch: do not clobber errno on read error
Date: Fri, 13 Nov 2026 11:57:22 +0800
Message-ID: <20261113035723.2215-1-gubin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

gpio-watch reads line change events from a gpiochip character device
and reports a read() error or short read with perror(), which prints
strerror(errno).  If read() fails, say with EINTR, the inner

	if (rd != sizeof(chg))
		errno = EIO;

replaces the real errno with EIO, so the message always reports
"Input/output error" instead of the actual cause.

Only synthesize EIO for short reads (rd >= 0), keeping the errno
that read() set when it failed.

Fixes: 33f0c47b8fb4 ("tools: gpio: implement gpio-watch")
Signed-off-by: Gu Bin <gubin@cmss.chinamobile.com>
---
 tools/gpio/gpio-watch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
index 41e76d2441922..e7733cedcf0d6 100644
--- a/tools/gpio/gpio-watch.c
+++ b/tools/gpio/gpio-watch.c
@@ -64,7 +64,7 @@ int main(int argc, char **argv)
 			memset(&chg, 0, sizeof(chg));
 			rd = read(pfd.fd, &chg, sizeof(chg));
 			if (rd < 0 || rd != sizeof(chg)) {
-				if (rd != sizeof(chg))
+				if (rd >= 0 && rd != sizeof(chg))
 					errno = EIO;
 
 				perror("error reading line change event");
-- 
2.50.1.windows.1



