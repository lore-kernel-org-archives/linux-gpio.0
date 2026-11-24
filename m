Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517950;
	b=Em05gniOIfhDdDzwynwIXeKdhTWFTCsLxAGl/veXz2+NvLDRKo+wf/0eHiWaxqrr7Dpl
	 sQb16uRqlyfTZHyU72PRdZaxLjdxXIYrqhIV/C8IvCiMVISVfeYEfD//cKG54U9BtuI0R
	 yv37YO3rhzlm5r4zBhSHJzZzUTr7M+phdt8mAzoOI9KWZ7ZsvcLKNpK+qVSm0HERXVdF3
	 i9MseFoeazjTCRGxH4vz4gPC7nIRwz+kU6+pEjvPQUMWSVWm6ABmyuwwpDI9ptts6/oHv
	 nNjomtpXJgmPN5o4M0cWhHt2iKFkzEO0DuEfOywSixtE6Gz0K8zZ3FVydyWyanvmlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ZiYc4MVZJSgk8bMEiYNjJrxtCdIqqTXjPmHiIj6dvrg=;
	b=dZ33p/1ZePKwaQyl1GsEnPjev9OoDP32lmOPkYreC8SMi6QzjHfneIeIXWCuUGhKNXMA
	 4xCXniZ2mtVseB0l0L30K5EqnDxjM5bEwaumXQEYtZaNhNTEQKRk6Tw7iNcdDe+259TO1
	 GYSmG67wqsc8LQVtyzS67wtlGB5gRPRBOKnXGlC31LzL4f18iSz0V+XlV8GQu8HUz+f6q
	 zqwM+QVUUmVnN/RpnHRdHNfrsOr00cU50RRXXObIPHCQDTWLaJ7lmtIPne1YoYK0nSvo2
	 qLPmfHyh12rshbNw4OXniWIdansEbJ4UAF8RPqxixOki5TmxUetoUVqc1yOM17xYPmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J96NcSkJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D67E606A31E;
	Tue, 24 Nov 2026 10:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=J96NcSkJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB9B71F000CA;
	Tue, 24 Nov 2026 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795517950;
	bh=ZiYc4MVZJSgk8bMEiYNjJrxtCdIqqTXjPmHiIj6dvrg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J96NcSkJKAbfv3cHfD7A2+ecCKKAPYjCmqo2kqv47Xx3E5lDpr3PoIl6JCy8MvTsE
	 oWoI+OqV95O3z9ZAwChpBNOuKFn0QlPRQoSkOSpBV2XLsyKEmYqrrzlzmkN5KPIBYB
	 ECJl6uv9kBGGwddnJnxqjh8g+JmZ1u5XMnJzRJ/DPKy9T2MfeGuhOOSJIVVzsgkYad
	 aP/bveaDx0/6tYedwmXRJ+cj7pNQgwAIUqUBGR4y38bo4xaA34Lspt0F8IUl8WPE1s
	 ILPyMYfGt1+zqinOdXO+IvKlAFIYMxyBmKwcu2+1Qpa+KuDNWJo5pryrcSPj5wsFvX
	 RI6CoKy1Lj47A==
Message-ID: <sashiko-outbox-231002@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yadu M G" <yadu.mg@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <7489ef6eb166f6292841030d299e72e5b27231f1.1795517583.git.yadu.mg@oss.qualcomm.com>
References: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
 <7489ef6eb166f6292841030d299e72e5b27231f1.1795517583.git.yadu.mg@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 10:59:09 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] dt-bindings: pinctrl: qcom: redundant word bindings in commit
  subject
--

commit 5a47c8885c12a8f81d5c670407ee64752fc387c1
Author: Yadu M G <yadu.mg@oss.qualcomm.com>

dt-bindings: pinctrl: qcom: Add Seca TLMM bindings

This commit adds the Device Tree binding schema for the Top Level Mode
Multiplexer (TLMM) pin controller on the Qualcomm Seca SoC.

> dt-bindings: pinctrl: qcom: Add Seca TLMM bindings

[Severity: Low]
This isn't a bug, but the word "bindings" in the commit subject is
redundant with the "dt-bindings:" prefix and can be dropped (for example,
"dt-bindings: pinctrl: qcom: Add Seca TLMM").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795517583.gi=
t.yadu.mg@oss.qualcomm.com?part=3D1
