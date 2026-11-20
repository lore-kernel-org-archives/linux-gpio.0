Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795155525;
	b=hjOa/TDmq6s4jm72+vrWSajLNK3T5GLzPkkGMh5QXlVeJiModADUBC1PCFQr1QFOkGus
	 CWGStrtHXGm8BIWmYYPWCdql+lEgqOAgAKE70mJ89rgwANTRo3DPQABHpep35rewKZqAx
	 lFJotbftkUxWxOXwthvAow6FG5FvIKFQX+wVf/glEMAgp5c4zfugVAwszcgsF5GUbLjzr
	 zcPd+Yi4/MBXnBspp7JkzwymJiDbHLb5XztreHYJTeKELloqtOHEGzAOmr7HKEIW9NLsR
	 R40xkowh6kQOpprb+u2JumDkUky2/G5TCerv3CFi1gU2OrvJR94q4niMdzAVCj5mI2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795155525;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kS1a0pw0w/ggA0msEovvtjN5pMkLuTlpEX9SGpmQoVQ=;
	b=OFz5SqNYKhDjeeKoUWPvFkNr1kCCQcgVFe0VLdjgiSJQpKmezhKdEinFuq1T9XWqKK0r
	 VY9yoElaNVvW2eNnIX7IBUe6Ys/6jZfh9zdGuF5Bf1qwR6HIUxCvAejjp3efr+xcKMj+1
	 +Hy3RkngCxNoQL1CI3Nfp5id/xF8XGRpKw2RqvqWpDSiWY/IHQ6tqi5JoXX69uIsGEmh+
	 G3A8IyqZoUmeAY9ivkt8ZwCrKBzXAie7U1fl1D8uGICn9Xq9pOpJLFO1ywnyaoVRFBK68
	 UAIZryO/DIhVFwFy4HawUp+W/0lNxkgnUOzRnYlL6cV0iiE0hRMGBFaUxTUNNfg/G9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dhlAJLdQ;
	arc=none smtp.remote-ip=111.22.67.135
Received: from cmccmta2.chinamobile.com (cmccmta2.chinamobile.com [111.22.67.135])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 470BF606A503;
	Fri, 20 Nov 2026 06:18:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 470BF606A503
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dhlAJLdQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dhlAJLdQxoLtrQITGmlIbPbMfHyb3AXGlv8gQ9l0EJqVCiM3fiGteRkNS2HWEZAQiwmUzUnNwwmYj
	 qFvwuECv8SGvjvAxEcQBApXIp2q9Qnj6PQ9wMgC9m4V7nvUcBl9GG5nVK1YThx5fsXwFIk9lyCAg9t
	 BrPPjLbXppcB7T9c=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76affe63aa77-25aba;
	Fri, 20 Nov 2026 14:18:37 +0800 (CST)
X-RM-TRANSID:2ee76affe63aa77-25aba
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform.localdomain (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56affe63c235-185f7;
	Fri, 20 Nov 2026 14:18:37 +0800 (CST)
X-RM-TRANSID:2ee56affe63c235-185f7
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: brgl@kernel.org
Cc: warthog618@gmail.com,
	andriy.shevchenko@linux.intel.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] tools: gpio-watch: Preserve line event read errors
Date: Fri, 20 Nov 2026 14:18:36 +0800
Message-ID: <20261120061836.98108-1-zhujun2@cmss.chinamobile.com>
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

The short-read check sets errno to EIO even when read() returns -1,
hiding errors such as EINTR. Set EIO only for a nonnegative short
read and keep the original errno for a failed read.

Fixes: 33f0c47b8fb4 ("tools: gpio: implement gpio-watch")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 tools/gpio/gpio-watch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/gpio/gpio-watch.c b/tools/gpio/gpio-watch.c
index 41e76d244192..a77f6d0cd0a0 100644
--- a/tools/gpio/gpio-watch.c
+++ b/tools/gpio/gpio-watch.c
@@ -63,8 +63,8 @@ int main(int argc, char **argv)
 		} else if (ret > 0) {
 			memset(&chg, 0, sizeof(chg));
 			rd = read(pfd.fd, &chg, sizeof(chg));
-			if (rd < 0 || rd != sizeof(chg)) {
-				if (rd != sizeof(chg))
+			if (rd != sizeof(chg)) {
+				if (rd >= 0)
 					errno = EIO;
 
 				perror("error reading line change event");


