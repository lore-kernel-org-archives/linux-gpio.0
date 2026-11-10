Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304717;
	b=MMzrDhsu7q5sltl05kQA77dUG8lS9R7XCALYDtyDIRLa9SZ5UPQRYpcT0m5bhdtxeafW
	 bpDSflKZZidhVgaklmcnkfHtPwbSlNGDwB8jbWEef14VvrT96lZlds81Db7CBkwMvNsvE
	 oOYJzbd6VU2k4QnTUEyOt772xyYSpcyFROamTK5dU5WuyBGX3CxJevWuv8h4pBNxinwZ7
	 x5sDVMKGz8qbH+qxM/DWtOizopQsL7TF8aBCYKcql6ZlJTAnTxxHEz89vg4QqPN7vTOf/
	 NAahWAhNuJb/aQpfCgmYkESicFtn2dIBdVykxwDIPgD42lhkaTM5x4H3M9g39JuahHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304717;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=DzEW6UCLJOTICzyTAhUEDf1Zrwj2XkRKQ06JY1C9ccc=;
	b=keBNFfg/JLP/nnMpxNEVrv7TWjRqXOAdpWnsGIqT5TO8fgnzWW/aCV8PR33q3G1hUK9I
	 JnEhLL8MBgqBJsTk+TcRZvHCZSIT/4dgMbOoTG4GTzyH3MZmDmEtXKvPjDgEXnfZsZLqa
	 n+v+zXMOGHmUqsNLkGGE4qNYIOg+zrA82oO6qIWjcX8MuGBkHKrv7bFY7VLKRmf77Kdh0
	 XY6PxqH7CbLEmORLywbZxDnBVBUkeBpOmp5w51MH7X/3WyQw74leLQKSE0+/AGyn+AP9G
	 7ZV5+lmfjReIQ3etydD/V6M++w9uHVri1icj3mkvd+G+5LvjeIo37bzOM4fA3oRrpzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGj0jTNH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6C7606A33F;
	Tue, 10 Nov 2026 09:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VGj0jTNH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE521F0089F;
	Tue, 10 Nov 2026 09:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794304716;
	bh=DzEW6UCLJOTICzyTAhUEDf1Zrwj2XkRKQ06JY1C9ccc=;
	h=From:Subject:Date:To:Cc;
	b=VGj0jTNHLl2N+vjJRfCO+f46ky2CM77IHi9GvqQWKrKMgS6p5A+lvCmZ2shYosXk1
	 lh5qccdKSRgA500wm+7rrnJ0AToBTXGs0U89zSFTSXXMVe0p4FnHpDqhV8iUy9Gprc
	 dohYiKuUGpSqAOUNgEKp9QVGepZwkZfBsoSeYRRjMudoXkZzMJdGz+z3i4mf57fTcl
	 e59Cfq88v/ONw09FvzEfL/CWv4sEGfJ43TQ595pDlNNuA3X3W5xfWzCy7n7vtuWzVS
	 AxbueNdfchLHz/XOI9Wkli2qqhsBNbTQ/YKMBkSJ/fzibs5B5y51Vy/RTHqz0ohB1N
	 flIntL0nnl+8A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] dt-bindings: pinctrl: Convert ABx500 and Nomadik
 bindings to schema
Date: Tue, 10 Nov 2026 10:58:32 +0100
Message-Id: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MQQqDMBAF0KsMf+1AYmzBXEW60GS0A2WUpIog3
 r3Qd4B3oUpRqYh0ocihVVdDJN8Q0nu0RVgzIqF17dN71/N+PpzjTS19y4cntay2VO5S3+UQwjS
 PHg1hKzLr+Y+H133/AHEnyQ1oAAAA
X-Change-ID: 20261109-ux500-pinctrl-bindings-4c94d333bfa1
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0

Convert the ABx500 GPIO/pin controller and Nomadik pin controller bindings
to DT schema. Describe the nested mux and configuration groups used by
existing boards and reference the ABx500 schema from the AB8500 MFD.

These are really old bindins, and one of the first pin control bindings
ever. Don't shoot the messenger, I'm just documenting what is out there.

Migrating to newer generic bindings and deprecating these old bindings
can be done in the future.

Prepared with Codex.

---
Linus Walleij (2):
      dt-bindings: pinctrl: abx500: Convert to DT schema
      dt-bindings: pinctrl: nomadik: Convert to DT schema

 .../devicetree/bindings/mfd/stericsson,ab8500.yaml |  16 +-
 .../devicetree/bindings/pinctrl/ste,abx500.txt     | 318 ---------------------
 .../devicetree/bindings/pinctrl/ste,nomadik.txt    | 148 ----------
 .../bindings/pinctrl/stericsson,abx500.yaml        |  68 +++++
 .../bindings/pinctrl/stericsson,nomadik.yaml       | 113 ++++++++
 5 files changed, 182 insertions(+), 481 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261109-ux500-pinctrl-bindings-4c94d333bfa1

Best regards,
--  
Linus Walleij <linusw@kernel.org>

