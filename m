Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032175;
	b=d9FVIrMkoFbCa2d6YIhfdmhcKWMPEQB4oXBgbIT6ATNfbp6arShE+HwAqRmEXa8WPIv1
	 pll57BynrLzrLvjMnUUq8Q8urcESRsYYv+XsxCC7J8ANXv53lUiisv1jnL8TczDdhUTxq
	 bMgiey0WLZ5uvKHEcP2NraGOWlaoFhh8lW4PjanJZH1fh2iSO+7LwIhNyPUapGMl++ddV
	 0vRYTcOGWf/KkaWF+f4YdMb1ZuLQD+mVOZiZmOKvcxkcudLmyaVv2GQYr5qnSECmHmEOx
	 8DqKwba+zTSoSv+5lrQzgnxyq/pWDIwji7yrWpEuIlGR/W8rNAXDhoA4IOxKBCpsixg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
	b=aUAN4jJxHR6CnFgYYS97l0B+nksTw8CVjQTk2nm/2Wlyp4i356iUmqWtGJzhyB7vzb6I
	 vqm0FDRQPvUTiTGzSA38pC83+gcnxM52UnbOE+KOoqvH6bOKgmVB9hEPemGTiGVOLT4+r
	 eauCrl1LWxOeIu3R4zf8fjvRCwcpBRV+IbeuOh1e/HwDmS/XmyA9t2s/mUoF3u43IjhZz
	 IksC3YFoA8skQN2YTJqHQf2NTESJEVfhRTMgKrRmEA5uTPp3cY7q+OsiAbiiTrvPFORj6
	 9DmUj+AD7XQktK4BhJnL0torwvcDJr19z97O5wWPU0ID5XzjMJy+fk6yUg5Ga8DdtSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EDQVoZKI;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75975606A321
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75975606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=EDQVoZKI
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2855193f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032174; x=1793636974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=EDQVoZKIFoHfyIabQaL7LH4hKsf9Qw78qyZwe7btZ3rAEDG9miGiW3Mhp6rT1GLY3C
         2hEdZE8VMyCjwNwTY1HtXWoQ+kOmULX86s+9YOZh0ZTTxOTb1Fzaikh+X9STyA+YofRp
         8u2HY6pI6Zkl+30+DqiYQhEsqqeDT2MW4aRNzAqiLZiHltaKDcMwTsx/QSvaNkmYgY7j
         lNoTG/OBg19+ni+x7bueG++TVlZOW/4GzN4jyWvUggBqUYFNxTc/nZUHeYmpWIqE86mj
         l4/2EmVagSsOo4xuMLzZAnypx1gNftYggWRnsPKRZl6YcRFLXUze87vGyyHjp0wshuGh
         wxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032174; x=1793636974;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6LxqbrR2lXu3aVaVPjXpNOCcYTO9SsUgRIZy5ix2VGs=;
        b=ztw/zhjX5oILf9iwRFZuTdScvFq0D8JrogEriZg4+7pm5apdiQEO8EM97avKb5bS51
         yNTV1QawZil8hRnNbM8vf4dg/AQhP4/H1cqRDR2SQ2vxJsBApNZvEddwGa87XgJZV6x4
         Meu3IC2DRtIr5dpHgNDc1UUP2CCRxsfDaBgDO5FH5VgwYtl1vcs7U8lh8snLpL1R5a5j
         3pdYHyAnwfy7IwhUqdFMRgsVMv3BNC75iGqtZwMxoTu2hrtz8hKhsv8mzynq+c0bCIp1
         v6iVm1MUm9FQtZtTrp5fs8Byr02esKb4bm+AHX/NeMScfQbnmUs6xXsoPgbH6Wm7Wuqx
         R1Bg==
X-Forwarded-Encrypted: i=1; AKwUvBxBcJU/BDLfKrDdujqcNJY4XAY0qVJQ4Vp2s32qBnn/HtTW+4t8Gir+jhu+95HVrMXq/2elADQTO2pg@vger.kernel.org
X-Gm-Message-State: AFq9FYJZbVxjCnNkZ6bZWbZNq308R34HE//0dUffogOxwTuv0YAfBoEc
	cNyVYksqb8EpLuVVaDwQlmKSrcqsVMlIgEvjyEKilMyAhQMwgkF59I6xpR/lVRvQkJ4=
X-Gm-Gg: AYBFou2GhhZ9c7/CCMF3/NQFVD3Ky2IBzi7At0rGOdp323HlaOmOV5eetYyuIpk1NOG
	Au/GWYcYbCG+k9qO8mNq9PiY0M0oRO4cGm+yrRPBdgd16+J3jIBywg/sIKMHVulMR41MogU6fcA
	JPNQAyR5cOEg6iu+rBu1yGqMQuVQ3BPaedgJ0QGZzTEfJXO/NNcuJDedK4E+lG7lU0qMlg2YVbD
	r7xAfT3NsEGX4t3Jvv2uUlWR6mXD19JXLOFQMWFBEOjOIRXJ5NAWBBMmPQgVQVEPTx5ZCy1M0nd
	hOMDzK5UtXtGs42kAfEGMtg1Wc9s9rdUIGYNHbkoTu8hjdFYAKxTkDiyx0c2X7j/Uhr31xeo90K
	RnugkmAmOdI/fZRrHRoc01kIqX3oCOxAEW+h5tIFIwEDk5BoktPC0Ae52m5r9jJ6awRRKpKcu87
	21pu3rC0aU/VnFq3uhvPPgqAOcT5fvHk5qUvpddOtXux522X1VFvG+SPZehoLQCBePotXOZxebH
	Vhb6oLbPFcNQKMlWQ1lai+FPlivt1JZX4posefyYWy3ZqD6JSLhrXh44+QS9HqqqIAAw4UCQmXe
	DgJMx6bD90M9/RZERaOeV/5Cq/oj1btIyody0FDDlxSMeIQg6qTLMd8J9zTqRuCc
X-Received: by 2002:a05:6000:4308:b0:48e:d88:55f4 with SMTP id ffacd0b85a97d-48e3eb455a7mr13165387f8f.2.1793032173870;
        Mon, 26 Oct 2026 09:29:33 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ecde7c3sm18281256f8f.51.2026.10.26.09.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:32 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/22] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
Date: Mon, 26 Oct 2026 17:28:17 +0100
Message-ID:  <6fe1e37942ee2f4d8ecfb4ff1a2313b9934165d8.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=968; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=LtmNoSs0VsyI/755R4pZVK8cbuvtZIuCZ1dOLhKQlds=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqz79atZY1dsTbNslwvpzeqcJ7rR+9H6s31pwZHsHZFFm j5KHx52MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjARISv2v/JL5va8mG/+fVPC 89Y1F+59zvY5at2lK34yqTzPtiZ8O0PSpJyml7fNJcKNvyvGxbspRXgHpEduuiRamLlzPTe/4ud XH7Kqlk91a1vfqFZT0jfLafHtT1NEuw+vOeEZN2ndTjH/d8F/rsvZzPs9tSFcZF2+zwNFYcGbWR 7cMo5fb4UUPYngrZvQ6mbcmvni1sy7e1S8H55lPvRCJKj6eoijVfj29hMCC1OCF+9Wjz7seqF4E 5/YokUfjvUmiLAYHV1e7pwbfXRP6eS3CR9FnwYrn963mtEsP3fprLvb6ucUCV0J3lVhwfo6vDwz Z+LhDSq3nrEdtlSsNIyUFJq6s7AkwE76yS2GVmYp7xu3AA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
auxiliary_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..ad5dc9a3a119 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio", 0 },
+	{ "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
-- 
2.56.0.rc1

