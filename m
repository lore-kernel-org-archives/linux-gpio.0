Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE184D0A12
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790353721; cv=none; b=uYMZxIgx9DizHCKPX12bGVlXZGA/u0Y88ZoBd2cDerCRFZ/mK8YjV5zxE8q29JX41BcmFeKH4rNDycQWWpLgBTfpQ2QCpgpXa97rwXmDsCOodaz5PWLkG9SGRSniw44jO0GpKKi5LWkC8Ls0qgtAOnzEYMqmaiIlsczkRHFv79g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790353721; c=relaxed/simple;
	bh=XzL7Uv8CKAnxpcOUO6KGyIQeIGCAlJYhjueKwobecP8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BjZ236N7ttNJXRau+QaP9AqB6wEVxvDwoYanJrjG200Htl5PPumnlap5PMHokFXH10nMAmPQUdi0ughufeBgLZLqHbs24JW14Wl9WaqH6nThfh/MRQ/8NIQmV6WkLyYeu/2BD7JZVTY9hi/5AqZX8//k0hYuLOIIwxwz2WKeHHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D/H+bdDq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D/H+bdDq"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 847ACC2BCF4;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790353721;
	bh=XzL7Uv8CKAnxpcOUO6KGyIQeIGCAlJYhjueKwobecP8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=D/H+bdDqMKI1fHSEOxgnA170SGmVhUvqhxppiU4Y0Bzf99T4J+p5nNUWB2rIOmjsa
	 keAmdoVF39/6vPt2Ny9RJYTe9g1uNnpwpd+VRjJAft+4K65O3YDpblNJD5mEGqRU6B
	 ZPnlqDiitFehv7fEFMWB9ikJ8GYYkGf78rQzvvaHiRqVa/Sk1/DnxuaQ6f0z53jeH9
	 a7Mndd3GMH6R29jDZvwbIedNu79Uy6sYQh8IRmIlSW8yiQ0nppd1r0hQMMknYpGnkc
	 49L6fyKXkxKPGx614P5bU373gFk6qHNes41IZY/Nkw77J5qK4+MBe5D1othTK27cnN
	 sAcE5W5xzWdXg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C7AC98321;
	Fri, 25 Sep 2026 16:28:41 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC 0/4] gpio: loongson-64bit: add interrupt support for
 more models
Date: Sat, 26 Sep 2026 00:28:35 +0800
Message-Id: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADOhtmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyNT3Zz8/Lz0YiAuyMzXtTCytDAySTROMTUzUgJqKShKTcusABsXrRT
 k5qwUW1sLALMPZFBjAAAA
X-Change-ID: 20260925-loongsongpio-829824a3d562
To: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=XzL7Uv8CKAnxpcOUO6KGyIQeIGCAlJYhjueKwobecP8=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqtqE2JujRZUCyC6KX9QaiH2qAoWySkeDG5n9Ds
 6tikP123AWJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCarahNgAKCRCwMePKe/7Z
 bg4DEACUXZQYjwzsQM0NCgYvsKPlPWuNhNA1DFLA51kocQYra3b+e6TDYQchzJPKIodRpZztaiZ
 sfnmNbj6my3pB3kTt/t6Z0icri5osvY8suxJCjcfxX9qUzb+pZ52C2gB6F0O8m78WIAyy20W2nx
 gDCZ6lcuidr3ZklrvAGuaw00CLrhafjakTr3ZfATUj+6ah1XomLI69Y35MitCtrUlEYWuaZCtJ2
 I5AbS5s1I/pmuqPSWYXHrWZtrh1aJoCNbrY4oEuYUoiG2S2KY4D+dYyj8k6CByLONK3wpsMxJrh
 QIhQAtRBQuv2Pa9rqxFdUu3odB8s4mB+qaCSoQcsSi6QmDsV7RCPj/IQRFYe/Y6yLrV7hQkchmW
 dksRL201pXxPy8ppdO5BsKNmI4lEhQrTdcY6nOPYDPGnSfj2ea2QimVrF1XXqFzcgM7DNiBI0e4
 rJubbht0Ck4r7kzu+fi6kFnUTtyDysbPnlw04R4lEZNwnARkuFqxwCxfVm8d6PUNNGRSwPDUwSh
 xqlY7CbE/VlUFrFT3Q674kNQGbUVT9PiOfBfzhqxVuvkHzHhooONRnQCYuiWFo4D2CoUgYx/WgZ
 BSXcfnxXVb+DlYTeHf+oG0oZexmBeSefgj0T2sfavXGsZ2mZrD4l+sWlCScmdOwRSpxG9UBONmm
 bNPCzIpRC0QRNHA==
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

This patch series aims to correctly add interrupt support for GPIO
controllers found on more Loongson CPUs. The GPIO controllers in such
models do not have a complete intgrated interrupt controller, but choose
to delegate interrupt handling to their parent interrupt controller.
This sounds like a heirarchical interrupt setup, but what makes it
more complex is that multiple GPIO lines in these controllers may share
one interrupt line on the parent interrupt controller. The details is
described in the third patch.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
Miao Wang (4):
      gpio: loongson-64bit: Support for irq controller on 2k2000 and 7a2000
      gpio: loongson-64bit: Generalize interrupt controller initialization
      gpio: loongson-64bit: Add shared interrupt support
      gpio: loongson-64bit: remove gpio_to_irq() handler

 drivers/gpio/gpio-loongson-64bit.c | 708 +++++++++++++++++++++++++++++++++++--
 1 file changed, 683 insertions(+), 25 deletions(-)
---
base-commit: 481ed5dd3ed7136f627b8ec372ba39f5b2e7d27f
change-id: 20260925-loongsongpio-829824a3d562

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>


