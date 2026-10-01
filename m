Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6B61F1932
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 02:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790820975; cv=none; b=heeSIcv6PJAU9ow2+H1dPhbaA5zvpr9EphugNcpa0OZLJ8iJbyx0zD/eCWBaAHcv5DviPWIHShrmyFE162pD+j0A9aW58xfXROjpsB3DOzo+WLBJG1G8YRJy7TX5aA8pra7Kc5XnP3ut4XVpRyPnOUb/hWxQOJ7bA6kbtNDINxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790820975; c=relaxed/simple;
	bh=nX2jBnvYS8wUE2Qbi8u0pjLWxyB9s0VVXYISCK8NbOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=knXogtmS7gZBCCQP3j+fUXbXTfO5vaWesHsmzFnZX3MLynvWhqmB7fZ1jrsG2n8KxVsqNOIBk5N53h8/DfU06epLUYv3hBxjL0eQhUsjgkb+Cvtwye7gqgAjCpuO4IJcgeWCoih2q5KUewi3+YYWde75/f5j5pcdbuc9nD6Ct5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5jB6y4R; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5jB6y4R"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4b37a368895so3327878b6e.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 19:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790820972; x=1791425772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQJet65ckrbNTaiHK5Z2CMeUS22oqKRz0qD2/TS3z8g=;
        b=O5jB6y4RZhB+mnHOi3LCSpZga3aOSGizh/o3pVnBgyzKjIVbbrPf8/yq0SlSlSmEBx
         TvsEV4kRL/+Ztkn/56MVChpKslJXkcCLSvOgqjC1RLhQJfSTyum607hgiND7v4f8cwow
         zK/XFPXxNFjg53I3fVOp7w5No5WawsWljDTe0oiI6J/urpTKmHsCIidPnsN31LEGCItv
         42L33wemIg9lxmeEHs+8JCl56PyMygDSE23D/2y5o9JLaQturfJM20l49DmQWpbUC3zn
         9vwUYi5YvD+bqL+jQB4TM0mo2wXn9EraWd8VFepAodbPwyoIvbIvoY9Kj6Y8AjiKn8WV
         AHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790820972; x=1791425772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQJet65ckrbNTaiHK5Z2CMeUS22oqKRz0qD2/TS3z8g=;
        b=CDeTfqtkHW+SQ4YAHiN+atm2GnwX28P/9/EPdb0Or+oJ/mnypRS2Wesupo0PeeaTjp
         bA+GIhZ5p4pCVGls9nNL7CgLMp34vtHOhdCypjtF6CfXqCRWq9L4XmUIRYPnMDQGvlIW
         gXhfjRRZ7XdI35s8u9Lo+3LqwIdRohrzsCu9W6ftp4K05gsRJmTxRrLsArNC2mC/tOBP
         v49E+bIJn6g98pWDCdp6fZW1aT9Y6trnQI0nzbxAdGroLK8uoBuTk6sgrgG0CKbawR8p
         5Q2tWJDafH94UbEkfqLb6KDLV8e+YLvKLclxf/cYTNKyzZMPao2WzwbxZlQtHeI5d955
         ZwPg==
X-Forwarded-Encrypted: i=1; AKwUvByl1J/ZMniUUADCuv4MzZqfc2MN9hShTStgjN0Lo9ykM2Sa7Yw65wi85LDWf84w6r+e8o2x5kxgnUsg@vger.kernel.org
X-Gm-Message-State: AFuF++mynQz6MRp+CNnLxXXZjQwZie/pAQAGml0D9ADZNMpnbp6qGB0U
	eRRSD2SSuDO6c1H02L0aJsCPlmPXjk2szPSZ/4QdND55kFv4Sy736xzk
X-Gm-Gg: AYBFou0rXcvjGcnVHfAkwz6Qlrni2yliZRDcA9J9UJJxfSBnQ1F8yq19cnuiQkswpTY
	qRWCjSwyLOpn5krxcSGfjzuG9F/owv3hyvX8BTlwbE654ET1yEHanSekTMAnoWeD9kI9V0sCD+u
	fYVk/gJJttAK0MjhMoFf0vBVVaFAQQfpjmLHMd4loxS7iB92PniPbyrZlbjr+DKTHbZQ0uMbRyd
	jGxv8j1nZTgdnxzD3VE1eWIC5fFy6tIGkvtF9RrmEnO7zESyhP7QWcjdabhft7fEbg1dLD9Ii3/
	5krBaXangbqxVekQROzs6YkPTVfk9etBbcZ4uinMfrkpqm2bGjE5vK1u2TvLXOjb54OTeDUnkXL
	vrZBvVS8+2+0DJcI9qj0ITtHBFSHzNPSHBpFkFEBuzQjf5BgboN72h4vtheCdYKY00PbzNGDCpz
	sp8M5+sfG0B/cYGYBJ2GT+biw4daGqlXNdf90WdU8Krgh6eB8wPdRpx/GTSt2sp1KlEymV6eY+5
	ZxWRj2WFIwtJP9Du+/lFQZqpxZdnFu4KvxlbUql
X-Received: by 2002:a05:6808:1489:b0:4b1:b83a:5878 with SMTP id 5614622812f47-4f1b688af5dmr4764409b6e.14.1790820972123;
        Wed, 30 Sep 2026 19:16:12 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4f345b14325sm1208801b6e.1.2026.09.30.19.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 19:16:10 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Shuah Khan <shuah@kernel.org>,
	Bamvor Jian Zhang <bamv2005@gmail.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Samuel Moelius <sam.moelius@trailofbits.com>,
	linux-gpio@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 1/2] selftests: gpio: enable GPIO_CDEV_V1 for gpio-cdev-uaf
Date: Wed, 30 Sep 2026 21:16:08 -0500
Message-ID: <20261001021609.167505-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-cdev-uaf.sh also tests linehandle and lineevent file descriptors,
which only exist with CONFIG_GPIO_CDEV_V1. Since commit 7673e4c7f7f9
("Do not enable the v1 uAPI by default") that option is off unless
asked for, and the gpio selftest config doesn't ask for it. Built with
that config, GPIO_GET_LINEHANDLE_IOCTL fails with EINVAL and the test
stops at its second step:

  # 2. linehandle
  # 2.1. ioctl
  # failed to get handle FD
  # failed to test handle ioctl
  # GPIO gpio-cdev-uaf test FAIL

Add the option to the config.

Fixes: c7f92042d3f3 ("selftests: gpio: Add gpio-cdev-uaf tests")
Assisted-by: LLM
Signed-off-by: Danish Khateeb <danishkhateeb03@gmail.com>
---

Notes:
    Tested on v7.3-rc5 (x86_64, KASAN and lockdep, virtme-ng) with a
    kernel config merged with tools/testing/selftests/gpio/config:
    - current config (GPIO_CDEV_V1 not set): gpio-cdev-uaf.sh fails at
      "2.1. ioctl" as above.
    - with this patch (GPIO_CDEV_V1=y is the only config change):
      gpio-cdev-uaf.sh passes, as does gpio-mockup.sh -t cdev_v1 (with
      2/2). No KASAN or lockdep reports.

 tools/testing/selftests/gpio/config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/gpio/config b/tools/testing/selftests/gpio/config
index 1287abeaac7e..54cf6484441b 100644
--- a/tools/testing/selftests/gpio/config
+++ b/tools/testing/selftests/gpio/config
@@ -1,5 +1,6 @@
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_CDEV=y
+CONFIG_GPIO_CDEV_V1=y
 CONFIG_GPIO_MOCKUP=m
 CONFIG_GPIO_SIM=m
 CONFIG_GPIO_AGGREGATOR=m
-- 
2.55.0

