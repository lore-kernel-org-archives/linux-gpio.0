Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863754;
	b=Bo1y9VXfIIuDcU2XR5gHPsWOZ+RLHEHDXrfru8uNNooztNDOkCeVizjDMqDN56SgAWcp
	 zqEzvyBoNNbhb0kyXV+hfvXX6enPNBgtkN5o83zDKp2zSrX6KrvL3MZUxn1T9l5B2PzLO
	 U15NU1Uv/8ydzOAEHSCB/3wmHotc1/XyFh9zhiXLqbdI8Qay/H50048tWJpgKaHzmCYmU
	 7jMF2CN8s3KhApoRokNm1U7k8dBGwI2kMCqRW3SgH4q9GvYaAXQFhNVyfczyjFuRKIEFW
	 Ei9PLVIoAJeO1a2W2Bc1H+yvCDHQwK1Ta/rtQoB8kKxGH/IcouCxuP1DKqbPT4QXthw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863754;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=YqCOGOo4FPzDVcuX+4UUwXDM2gP1PBCZnYRftUoIm/o=;
	b=34ih8Zuf3xvRRUlsy7VWsUceFGu1Rd+4cRa9B8TE5OIXg5ws7vZKwcDZSIfQBs/b14JF
	 zDhrWBVsRlqxfeGPHjUQLEh63dTDTHA0CJ2tXcxTJvFI72+rmSQ5k2wKQKVHnFDhnsbFH
	 iKXWk9SUeZ5QlCjjWZAH4sWFwq6KQromkglFMsXYhs2VUXnPlLytPXmn9JrU3kceJr4f6
	 Lf4XSHUoXVs0w2q89HWcYLqwDzMspOhFqJ263JcBgNkeM2L1nGXbCBjeHYmqSGgw+HFho
	 6I6mON60lGvHkMF83vYKcjrhzzi6UJ9N7y+oHLxYWYzFMeieibA8Pht+wEwoP5571wQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Xj7He5+f;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF8A606A31F
	for <linux-gpio@vger.kernel.org>; Sat, 28 Nov 2026 11:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF8A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Xj7He5+f
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652ad;
	Sat, 28 Nov 2026 19:02:29 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: linusw@kernel.org,
	brgl@kernel.org,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	maz@kernel.org,
	atish.patra@linux.dev,
	wesley@sifive.com,
	yash.shah@sifive.com,
	kamlakant.patel@broadcom.com
Cc: linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH 0/2] gpio: Unregister SiFive and XLP GPIO chips on unbind
Date: Sat, 28 Nov 2026 19:02:27 +0800
Message-Id: <20261128110229.875394-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa221d2245203a2kunmfbc41f2a3cbc75
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTU5PVk5CH0hDSR1LQxlNHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=Xj7He5+fa2vjcQ22Nk3R/Tubgx2hhS+ihLGmHiIy+cqJL0yqz8tQpaXo19CJL+rVGwSpfD207aiYg9KSop3qxbjputu96gA02hv3tdsQf+/MH24gt9Nx/nVvsirRKYnSS4oASkBTYCrvYmJicMeYFdmDRoj1VH+uX/tBk00W9ZM=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=YqCOGOo4FPzDVcuX+4UUwXDM2gP1PBCZnYRftUoIm/o=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

Pair GPIO chip registration with teardown in the SiFive and XLP drivers.

Tian Xuechen (2):
  gpio: sifive: Unregister the GPIO chip on unbind
  gpio: xlp: Unregister the GPIO chip on unbind

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
