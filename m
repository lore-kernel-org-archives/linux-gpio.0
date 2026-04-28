Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9E91A681E
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367761; cv=none; b=ia2isvgk7xvti7dzPjvZm+tiEhYKmxXSuSNQjXc3UXqUTEm3b8/F3RB/QLgFc1eCzSCrSCuidNHgEx+JaDNcXSYmwdsJo2oMXMNnW0EDn4YW8laOX8o6KMCVg4z7BbIDEg0YfNLak4xH2ztfpHyik/JT6dDuHujuVvyXmB2zssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367761; c=relaxed/simple;
	bh=KBLKYRFZhDEbPXC6YzQIdR3J0xUT2y0Qz9qzcN8YkKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N34cy32Fc6f2HtDYqH2dy2Y+a9up7Z/P0+O7fDpuvcVjyiZSKMBEqvRIvw91PLtSxO96Azk5/kQzkWDNnuFThsObcOjamC67kJKOurHOu+Dp1JoqrKMqC9P0otbkuVW0JuwbpAnRpKRxGplWP9uARvS/6+JK6HTGYFKpVF2ecgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfm6zjaB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfm6zjaB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF86C2BCB5
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367761;
	bh=KBLKYRFZhDEbPXC6YzQIdR3J0xUT2y0Qz9qzcN8YkKE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jfm6zjaB3izGEfCC65uhEPggZgfNgk3xF+EQCQetb1mFQIpLbAGBV0wqtiVqIWSXs
	 KeJNesjsVaGRxrm4RAQSvjHa2FrjGuxEQPCzojxXA0lhLj0n58e+SpdFbF0shCAKD2
	 mb31hDUrk7bFr7u46+1zHUo4i9yVj7pXsegLM1nENTxG1SM/YqRjAFvpVtNYpM3TIg
	 SvlhA627zimohiF9kmaYSHYlSUjLdZsT8WXw1DONF6oSzc5/F9L/um/dJnhSJJy0OH
	 j83uhNI3Nnd8Svv11dv8k7EOwAPa7NrbVNOvUCKX2jDFla5itO7wCRxDDMUoeDIWQl
	 x7GhZOqS3AYxQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so10864112e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 02:16:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WpkUMswsm7vBeILuKVJ3LQ4y9QF2eW0YF76G5u/xOBxPL1Rvp9MQZmwVgI6j8EPwjOfYpGruSdpJ1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywxs0erQ95zH/N1ZO5YK82yiTsMWS1pZCbwUrwpLhWoh2cmRqkE
	DuLHuC+Bj9V977BN/2tsNxBHtMGtUTmUotL//IWgBDt7GGi3mjRSi5bjvCBJeiIkKwMpSQt2hc/
	Z23Svoa3JD3nMk6Hi/zySNaOeu2QUwlY=
X-Received: by 2002:a05:6512:3b82:b0:5a4:4ea:9977 with SMTP id
 2adb3069b0e04-5a74660380dmr920030e87.8.1777367759619; Tue, 28 Apr 2026
 02:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410111047.309798-3-krzysztof.kozlowski@oss.qualcomm.com> <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260410111047.309798-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:15:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=kzz=ahDXd6H7-DV2-HfGMnty467zEkzGLbcEjaE_99w@mail.gmail.com>
X-Gm-Features: AVHnY4JksbqS1Q0pqN7DxqriD1H4C_6mQwAPiRs9WfxUS5DXblhxmH9rWEvRfZc
Message-ID: <CAD++jL=kzz=ahDXd6H7-DV2-HfGMnty467zEkzGLbcEjaE_99w@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: nvidia,tegra234: Correctly use additionalProperties
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 1:10=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> The binding does not reference any other schema, thus should use
> "additionalProperties: false" to disallow any undocumented properties.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij
