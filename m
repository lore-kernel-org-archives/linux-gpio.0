Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795682881;
	b=W/WWOxRu8BXucvZEFmyNWdxvlbvwRKjH7j0Sw3hFk9tLQmIsZe7f4zKmbt/LBgk5herH
	 pvg+FAlENLebVhgtYY+2rZAH5M1vMBiRG9Bb6lvfP8Evtn67cTrWYlGkH1nle7OvWWoSB
	 O4luZQpunWbWWVatyWzYnrHGpBrjdw95pLieCF9696Usk3t+dPDuairNh1h3kkq7o3rP/
	 blKeNjvwgVTo00L1LM9T/iXf8BnkPBCznvEdcI4bski8y8tEetv3DJdtd+EAFm+vkYHwS
	 34OU8HTOjDAfmMY16hF02RyK4M3fCLBYLHlfGyf9gYlrneg+Lt5Yfjhl6neJiuXvCYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795682881;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=YOi4GzTgYmlG+CkzQlU/MUQSDPryjc1Ii3+0qKzW5Dw=;
	b=EYWqEwACoMM7T8VH0+jBXC3aSe4LP9KvX10wLZVJ4ryRM4L2AiLM3K46Eal7OL6dVJM1
	 0pQe9YOdPhML5/AHwrjPmuxG6hAkfPeSMyZiSs7fVs3AFleLE/NGtJV0LCrWNmUJMnc5H
	 sg806HbhkwERWIhj58PrRSeRdWCKFG5bPag0eiz1eBeSPaSeY0VjaTgTqZhTwcaz6CBHx
	 V6/2rR6bG2XZPk8Y6sfxaBnWxLfm3Z39IulDZe6dxKiqmWvysMezPgbQ1F8bIA+DB6Wyl
	 DrJypVXba5A1vtgDFbamUkVcKfeQfI8w6VMHKgeGMQVa6h38vYt2936s65pVDl5vKdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfJI8IBq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02E9606A31E;
	Thu, 26 Nov 2026 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FfJI8IBq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73781F000C0;
	Thu, 26 Nov 2026 08:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795682881;
	bh=YOi4GzTgYmlG+CkzQlU/MUQSDPryjc1Ii3+0qKzW5Dw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=FfJI8IBqSregsGEd8fZV1aPuGW74z4bW6L/u+WXgbzs24MC3b5ds+5tTwKdDVX06/
	 xVeTiCBVjTULz/y/tP7cSWGEgeZ3qY6tQCieQt4gUznP9ONkiXIw77djTHZpDGpd05
	 TzkNlcHy5RKXX/gDeD+IIy52Liuj+1E3/47sL9a4RQRIuyGCcXaiuHWw44FSTHIOuu
	 MSuNe0MmflhltbEb+33S3iQ7CWSeJyUMzFsVQsrguB7fj5uxXacdIeFuTekoLNsvjX
	 22lWwiTbO6keu2aMChR5gRJwvyQcH8N/TwM7QHHNwlP5hvVcrR2T4aiRWmXxbBsy8W
	 eqkVFmxehCgfw==
From: Lee Jones <lee@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, John Crispin <john@phrozen.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, 
 Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 mfd@lists.linux.dev, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, 
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com, 
 zhengping.zhang@airoha.com, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261124094059.3882014-6-john@phrozen.org>
References: <20261124094059.3882014-6-john@phrozen.org>
Subject: Re: (subset) [PATCH v4 5/9] dt-bindings: mfd: syscon: add
 airoha,an7589-iomux
Message-Id: <179568287744.25464.2687461126897937244.b4-ty@b4>
Date: Thu, 26 Nov 2026 08:47:57 +0000
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
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Tue, 24 Nov 2026 10:40:55 +0100, John Crispin wrote:
> The Airoha AN7589 IOMUX block holds the 4 bit mode field of each pin.
> The pin controller reaches it through the airoha,iomux phandle. Add it
> to the syscon compatibles.

Applied, thanks!

[5/9] dt-bindings: mfd: syscon: add airoha,an7589-iomux
      commit: 635c680b2ea58b3bb75464f464a23eb4bacbb0fd

--
Lee Jones [李琼斯]

