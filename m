Received: from ultrarisc.com (unknown [218.76.62.146])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDF9A3043CE;
	Fri, 12 Jun 2026 01:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=218.76.62.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781226363; cv=none; b=DaqhRYpFS5EsnV8vUMLJa0HqIHTIwHOeCcuAc5O8ZiKksoGll60d9WIAeJZwatQovZgB0buuUuPbwT6BQPb1cP1fZnDAeO3AeTJyB3+XP3SZgksnk8jxQFVBJSj6rYInK9ddGucYklczHEaXBeKkSY2DSbY8PtJKSzfoOZrhfRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781226363; c=relaxed/simple;
	bh=6H7FhgPeV1C+qbcIVAYT/9XGIYXJqd5LkhNSGJ8wEVQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=I+weR7CRtDcRRegsOrzI/RrjHSt8TItUUWlm/kS5kmPqCPjJsq6mqT7IfYa1ok71MDM9NK7aPfS6SPCYwDElzpRkWJcBxoXreZ84zlOjRYaVBjOKwgXgUzS1Iz3RMewUEoG0NWFOhFBmDNv8Y98wV04h5VjU9WLKAsM/lrMe1xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com; spf=none smtp.mailfrom=ultrarisc.com; dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b=ggtzVOge; arc=none smtp.client-ip=218.76.62.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ultrarisc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.b="ggtzVOge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	References:Date:Message-Id; bh=HWDkY6clhQmlnL2nYh2AFuK/BAC+DEPZz
	jkqMqByAlE=; b=ggtzVOgeKGNythdxi52riCaLnWoylWJgqeEcfqoG9/SK1u6K7
	IdwnuUaQJjE8i/Dx4RUkenG3BLx+4U3IhGXFIwaNWY8fJxWf2USo/EkQDBXT7HOc
	Iz0p8l1jD9hfK0YkyDHEDspWYabFOFgvIsnWdjmFAV9JZSecbOMNWxtpMk=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUKPWytqZ0kKAA--.9062S2;
	Fri, 12 Jun 2026 09:06:23 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/2] pinctrl: ultrarisc: add DP1000 pinctrl support
From: Jia Wang <wangjia@ultrarisc.com>
To: Linus Walleij <linusw@kernel.org>
Cc: wangjia@ultrarisc.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
References: <20260610-ultrarisc-pinctrl-v4-0-b7e9b2a8ed84@ultrarisc.com>
 <CAD++jL=m6++zOfq2gP4-y4N7U6nx1buVM5KMoxWJ_9PM6RVV8A@mail.gmail.com>
Date: Fri, 12 Jun 2026 09:05:46 +0800
Message-Id: <178122634683.2408461.10784730640588716167.b4-reply@b4>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781226347; l=813;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=6H7FhgPeV1C+qbcIVAYT/9XGIYXJqd5LkhNSGJ8wEVQ=;
 b=+RaRWjJ18DQyyG78WOME05B9R9HUuIwNrQ27sPO6pI5dyFXlu6PC5gTPYxawh2nIR56TX4jx+
 rQgLUv3TqOsDq3/9ksAAuMHIa3C6fT0l8VXueqb2X7oRibywk9WQH31
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-CM-TRANSID:AQAAfwA3cUKPWytqZ0kKAA--.9062S2
X-Coremail-Antispam: 1UD129KBjvdXoWruw47WF43XFyDAF1xCF17KFg_yoW3Wrc_uF
	Z5Zr1qkw1UGF4Ika1DArsxCF98KF47WrykKryvqryUAr9Fyrs8G3WrKrsxtwn5ZFsYqF93
	CryIv3yv9F1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb-kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
	IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
	6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
	AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
	s7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr
	0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAAEWoWakYABgBTsV

On 2026-06-11 14:24 +0200, Linus Walleij wrote:
> On Wed, Jun 10, 2026 at 7:29 AM Jia Wang via B4 Relay
> <devnull+wangjia.ultrarisc.com@kernel.org> wrote:
> 
> > This series adds the devicetree schema and the pinctrl driver for the
> > DP1000 controller using generic pinctrl bindings.
> >
> > Compared with v1, this series is narrowed down to the pinctrl binding
> > and driver only. v1 patches 1, 2, 3, 5, 7, 8, and 9 (vendor prefix,
> > CPU/SoC bindings, DTS files, and defconfig update) are not included in
> > v2 and will be sent separately.
> 
> This is a very good looking driver so I applied the patches!
> 
> If there are any more snags they can certainly be fixed in-tree.
>

Hi Linus,

Thanks for applying the series!
 
> Yours,
> Linus Walleij
>
 
Best regards,
Jia Wang


