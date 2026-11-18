Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795028646;
	b=ptIuw6SmrajJghtO88XYSONIPldyR493xa27M4UB5hLCgEWs2mli2i0oA7sz7LUaQPfy
	 A2ob5Y/7sUk4g6Z3tQDH/1ApYGzs+MhG4fN3J+Q3FWqM+AbjQCx527tq9uq3Ac/PRecjN
	 E8k/9Ymcgdxx3sNXjf71B9HNrLpic/Rk5+EdazfdVq5liaTQ8Fo78jAc7smJshVOYcur9
	 oMJMS/UYdYmTj2j29V+nh3mnLf5n0MMK9PuFHNPSS58nbxHHwoYph0I/Tphk0Mc1mAmwX
	 zBOjWGObnSZA/1RYBL7gnGJEGdkghyKzA8i7fkf/BWGKgHGPTNOM868JQj1OkjL0AlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795028646;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=jB3zNzp9bGFfrdi7e1OlyYov72F+Grzt3PWA5XTMrYY=;
	b=x8e6c+yFZv1z7tQSi7FNDIEMjeCIX6cHaayumzj8o1t39kQC3s9qe2I6ZntVYw+KO+K9
	 Eq1Jj0CXB8S5Co/9aWO4isQfBOKVEZhyfUbwmwR5BdVOVoToWy5kuzB6ccyuJKPcAJHlS
	 a8ncp9t/0JpnCADT5GIffmbtdele/mg3csIGENtCCFXwMST9gZDDduLPho6HEi/HKyu2d
	 VysYy77pB4EeiGjtMelbx7MsOUs9CimBLEsIKGT5y5cf56gFV1H0FH6jaC5VNYq7Hzgu3
	 KcxDXdINrzhatcqtD/G1LDY4ddz68r1D5+cQVgAPSoc905QEoxBqwTR27CFcWJnP/RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luixo.me;
	spf=pass smtp.mailfrom=luixo.me;
	dkim=pass header.d=luixo.me header.i=@luixo.me header.a=rsa-sha256 header.s=protonmail3 header.b=vJQcywnn;
	arc=none smtp.remote-ip=109.224.244.107
Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CFF460A2604
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 19:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CFF460A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=luixo.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luixo.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=luixo.me header.i=@luixo.me header.a=rsa-sha256 header.s=protonmail3 header.b=vJQcywnn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=luixo.me;
	s=protonmail3; t=1795028642; x=1795287842;
	bh=jB3zNzp9bGFfrdi7e1OlyYov72F+Grzt3PWA5XTMrYY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=vJQcywnn3WPlHrpDbMIAMo3P9YDkcI3FTs9vLZq02zcQGPuqsj72cJqOpDxuoO9Fz
	 +62w2VZeh0Mp2grCZkRDUkC6+Xs73vr86CYKHWcAmNmWsF7ihEpjJbQPPFmMI1uZO8
	 9t0kROHiIMhLXCzvSTDp5JxqXeFASZdJn/nTQMYUwaudsCKR3RKKtFwWJPGnmsXd3k
	 0poBxeG1b4ELrEGXQ6KgdxMwZh6oZ3fQrMTeH3R/VYBDfKB9jC/5JtpvO7ClRfkPnB
	 weOPS24W+vsIfgPZ7EFF7KwRRNqY2hhEHxu9m1G7iD9BYKqmctaMDVNdFlcAPl/sef
	 r9ylIEA31BJoQ==
X-Pm-Submission-Id: 4jV9xW1Zl1z1DDLH
From: Alexey Immoreev <luixo-public@luixo.me>
To: exxxxkc@getgoogleoff.me, brgl@kernel.org
Cc: andersson@kernel.org, linusw@kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH v6 4/5] pinctrl: qcom: ipq5018: allow it to be bulid on arm32
In-Reply-To: <20241007163414.32458-5-exxxxkc@getgoogleoff.me>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
 <20241007163414.32458-5-exxxxkc@getgoogleoff.me>
Date: Wed, 18 Nov 2026 19:03:57 -0000
Message-ID: <179502863770.692988.1837894979494592810@luixo.me>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Karl and Bartosz,

The Xiaomi Mesh System AX3000 (RA82) is another IPQ5018 board where
32-bit kernel support is useful. Our working path from the vendor
firmware enters Linux in AArch32. This is a property of the chosen
firmware path.

On the current Qualcomm pinctrl tree, `PINCTRL_IPQ5018` is still
unavailable on `ARCH=arm` without `COMPILE_TEST`, even if the Qualcomm
pinctrl core is enabled. Your v6 patch makes the existing TLMM driver
selectable on ARM without changing its code, DT binding or ARM64
dependency. The separate IPQ5018 GCC change already landed as
`5d02941c8399`.

With the same Kconfig change and `COMPILE_TEST` disabled, our downstream
ARM32 OpenWrt kernel booted on the RA82 with a working serial console
configured to use TLMM. An isolated check against the current Kconfig
confirmed ARM32 selection without changing the tested ARM64 or
`COMPILE_TEST` cases; we did not build or boot the current upstream
kernel.

Since v6, the driver has gained `default ARCH_QCOM`. Adding `ARM`
alone now also defaults it on when the Qualcomm pinctrl core is built
into a 32-bit Qualcomm config. Is that desired, or should ARM32 be
opt-in while the existing ARM64 default is kept?

Would it make sense to revisit the pinctrl change on its own? I'd be
happy to help refresh it against the current tree.
