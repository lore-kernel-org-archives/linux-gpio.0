Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863233;
	b=gPtn1aIqZRFs59Jc7Z1OzoKoyLO4TvExtmcbCSZd8k14tAiqk3m6gMxM/AEqDal3tcv+
	 zIL+epZuSFrXFmTP63c6hDQbFnjjIOuDkLp2Z2tc1UXLcWqUexL0co9eNHl78rOXTGtH2
	 W1jDe1eD+DUy0gr5mazSaDg6w5R8bm1S9XO5jLI+FrUjNQUhA4jVng40/tISPNgOHNjrP
	 xyGKpuR82Aexgfj18qVEjzycwqAPbxBaPRqD9lRqxxVyTrUXiKNvAG/Hq9Hhk15O+SvRQ
	 GZ5uQUXVDWTaxncUtXVk2HODm/t0EV3I3l06xxqLedgrB0VvM4ge2YxVZm+xjFxeeEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863233;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=D0DNL51U0n9mxUhb3hB0S6V69hcquNmMsqfP6uOJ89A=;
	b=H6wyshPOnuRhPDjk2jojVW3shWA/EisihGSwl/kRjuD+hp34OMuMmkKLZSt7haROKu3P
	 Jq7Z53YEmJTrWSwoCPdH+mWRirVKQh/LZtEbOoPLJJ3XCwSQ37oNxUQaMExt575a6uKS5
	 dQ89HR6aZOCQoFgAA9kJgwLU0DajH+ATkfiIX2wHl8vDCANLUr0BzkNfFH0lecRSreVk7
	 vJHNdwAKdWS9eVHTVIfnPpamCyOiYfuBn6YMy89bl6gI5Rmms5mlX2T7/lp8zneGi7sH5
	 PemryIZIsKQUDu3XFKy+AyDFx1WUIA2Vq+XAWawrbCEE0rHJBfND60GBbnn1s0i34EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3KbW6eN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5D7606A31F
	for <linux-gpio@vger.kernel.org>; Sat, 28 Nov 2026 10:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=h3KbW6eN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E801F00893;
	Sat, 28 Nov 2026 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795863232;
	bh=D0DNL51U0n9mxUhb3hB0S6V69hcquNmMsqfP6uOJ89A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h3KbW6eNwH4OaLIcTQtSb5h9EIlaC9SEGuD1QmMisZkSjZoajvBwlEPB6MBJhFFlh
	 GzB12JSDHu70epr00H+upGqMSHE1gMTtkiJgzJp2Nvs0L46IC6wHcorRoxm7p0TJ3O
	 C9/Zz9SB5oJka7KP1eSZmcjxsWhpsoniRzV3er/G2Gh4tbyHK9Xb7iZlN/RqOocL8K
	 gyUomv/2l9sjyWWg0UEG0L6RSJ5FDY/v4WzGpFwV+Bnf3WBr+HOKD7AC0OzfL5iTXO
	 AjUnqWy5emmEs97T9n7Rb/3pLJVO7/BlNQcCZ/4bjHsVH838w3oe5qrakNcClUOVUC
	 YQyA6ez3JlYZw==
Message-ID: <sashiko-outbox-238637@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] mux: convert to use fwnode interface
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabio Forni" <development@redaril.me>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261128-mux_fwnode-v5-2-6689b52f3800@redaril.me>
References: <20261128-mux_fwnode-v5-0-6689b52f3800@redaril.me>
 <20261128-mux_fwnode-v5-2-6689b52f3800@redaril.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 10:53:52 +0000
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
- [Medium] mux: missing !CONFIG_MULTIPLEXER stub for
  devm_mux_state_get_from_fwnode()
--

commit 85df2293bc5cfb5c47da8e60c377e0e2a2ce0040
Author: Fabio Forni <development@redaril.me>

mux: convert to use fwnode interface

This commit converts the multiplexer core and consumer lookup interface from
Device Tree device_node APIs to fwnode APIs.

> diff --git a/include/linux/mux/consumer.h b/include/linux/mux/consumer.h
> index 449e38e6e2c51..7d121217ca961 100644
> --- a/include/linux/mux/consumer.h
> +++ b/include/linux/mux/consumer.h
> @@ -11,6 +11,7 @@
>  #define _LINUX_MUX_CONSUMER_H
> =20
>  #include <linux/compiler.h>
> +#include <linux/device.h>
> =20
>  struct device;
>  struct mux_control;
> @@ -62,7 +63,8 @@ void mux_control_put(struct mux_control *mux);
>  struct mux_control *devm_mux_control_get(struct device *dev, const char =
*mux_name);
> =20
>  struct mux_state *
> -devm_mux_state_get_from_np(struct device *dev, const char *mux_name, str=
uct device_node *np);
> +devm_mux_state_get_from_fwnode(struct device *dev, const char *mux_name,
> +			       struct fwnode_handle *node);
> =20
>  struct mux_state *devm_mux_state_get_optional(struct device *dev, const =
char *mux_name);
>  struct mux_state *devm_mux_state_get_selected(struct device *dev, const =
char *mux_name);
> @@ -165,6 +167,6 @@ static inline struct mux_state *devm_mux_state_get_op=
tional_selected(struct devi
>  #endif /* CONFIG_MULTIPLEXER */
> =20
>  #define devm_mux_state_get(dev, mux_name)		\
> -	devm_mux_state_get_from_np(dev, mux_name, NULL)
> +	devm_mux_state_get_from_fwnode(dev, mux_name, NULL)
> =20
>  #endif /* _LINUX_MUX_CONSUMER_H */

[Severity: Medium]
Should the !CONFIG_MULTIPLEXER branch in include/linux/mux/consumer.h define
a stub for devm_mux_state_get_from_fwnode() instead of devm_mux_state_get()?

The #else block still defines a static inline stub for devm_mux_state_get(),
which is shadowed by the unconditional macro below it, leaving
devm_mux_state_get_from_fwnode() undeclared when CONFIG_MULTIPLEXER is
disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-mux_fwnode=
-v5-0-6689b52f3800@redaril.me?part=3D2
