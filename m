Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CDF3043CE
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923591; cv=none; b=bTH9/n8Agg8P/6gE4rf1N/6zJbB5lbeBNvN5liTXF19qa+UJ+5fxir+nqiH5fh2WSUIaeKDH6zLi4VvJKycFEoAbwMBCrLiR2i3MToK/xlpW0etiMZwX0VY5KockWJkzjbhTwt+o5d3AdOLb2uEgwgkKKt1JIvd8l47YgBzD+D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923591; c=relaxed/simple;
	bh=lnhLem2XceV3pkuUOPOzNVK496IDuAS6Fz9EZZTLZDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EwiwBcsd5jXWyBFUtDpSetvGwoqew1BXv0Q5qFLKCRkYCOm7gbIuxOHPWl1D+DJkbvDsZYzQqcGARLtYq5yxQRlmGF/ZuhlGzy2c0QjMGTD8wWLkARcoHFT0FyD3rB8D0dGMoacY3VdRTF+N7LANhc8S+HmiOGM0XzoNDBsIpI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OGPg96sA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OGPg96sA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF6A3C2BCB1
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923590;
	bh=lnhLem2XceV3pkuUOPOzNVK496IDuAS6Fz9EZZTLZDs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OGPg96sAODW7wqtA1uf+71Mk5aGsU9mJID4Vhqky/fq3t7dyRnKEejzEahlvF0kks
	 MwE2U9TbBg0plsvVss+faU5N9eS/irEtfP5XiyaQ+RuOiU86d1CLakBKi4WmtTPwVG
	 PDW8khAFXliQt0Y/o/dnjniaWha5/yarFbCzFR+aL9bmyOtPTGn5Ihj+tf2fcV3Wui
	 0PS6r6I2Uz+QbDCGgM4GPnQ5nYhAOClwQv5nmvxvqEXnasBKVvqcHiEMwDc6BOLmAb
	 5IRgSwEiFkc5KyUBLx7jdgKxgOwqwYypcymaPo7tezkrNul0u4ZK2MlfmeDIiav80p
	 mYnG7Fi2vnABg==
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-79827d28fc4so27327767b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:59:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVD8rjxasv36SiuJ5O+6uy28GLCc5kocxGx8daXf+guUGMeAbhsXMnQWMIMd+YEDl9UayCXBbulZ95m@vger.kernel.org
X-Gm-Message-State: AOJu0YxSdXww/A3DUpb0nJnMcxgzQyOlhtfkczE+1VhuX/6rnXbY/2Yg
	Y4C2GuXs7UTW73MpmHvUOG9rUNSFw22NGEGaaRwoQWokaKIRUuzw21/RbinBrAsctUw0ekxXfDw
	y0eQtezoG8tpdg56+YsfsrBXbUf90p8g=
X-Received: by 2002:a05:690c:4806:b0:78f:a616:7b99 with SMTP id
 00721157ae682-798290172b5mr93654927b3.49.1771923590224; Tue, 24 Feb 2026
 00:59:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
In-Reply-To: <20260219-a4-v1-1-9666d6edbe2f@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:59:39 +0100
X-Gmail-Original-Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
X-Gm-Features: AaiRm53Vb4IAD6Sp1D0WlxQIdn1apde_GXyUgxJPFAFGQfJTy6x8-4GGpF2nJHQ
Message-ID: <CAD++jLm6ybwu3coyZfOh0BwvscGBp+B+oHp5bUR5rUp80cSjHQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: Fix device node reference
 leak in aml_dt_node_to_map_pinmux()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 5:51=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote:

> The of_get_parent() function returns a device_node with an incremented
> reference count.
>
> Use the __free(device_node) cleanup attribute to ensure of_node_put()
> is automatically called when pnode goes out of scope, fixing a
> reference leak.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied!

Yours,
Linus Walleij
