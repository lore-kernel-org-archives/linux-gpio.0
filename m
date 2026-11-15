Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740729;
	b=AfirtTy7onBEXZJIR8lhf1W4+5KuCsXoSgBbJEh7DPefgAaXxVatrut1lrHmsc2tSn2g
	 RtE/hxK04y+plbjaAtNybkk0h15rqgbY/wSb18pYTE8dhP9K4Jrt9sEw/1PqaixheEKM1
	 gVC9pI02XQ0bLWtALwjtbjjMmMTOfac4C59Nt1snATJf/MYd4QJ/WppbUR2ka4fFq68YE
	 vPZmCq6AZyHB3FO5QiGm1OuG+tuyX+S9H7WUCOKeEsdgt3WQoWa6EzyPwE4yWvpEx0iN2
	 r7uV2Omb2PNPfJIaGSxlzaS0JmuuxRkyfSdxVjHsqctbSfqeH8QDngVew4+n55sqswA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740729;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QArUHYLf9L/U2NYw1vy2o+lKGGFsWVtZNi4VVFga1WY=;
	b=vXwXJJLHIKG2xR4B4MO6nnSwkxVFHrnsxbg/d81Ol/mXdz9JGw5ICP1LocZ1VjOlHxhh
	 KNJ5sqqjNwvcr//ECx+aQ/SEuHYdviIePLMYm0iepBHcVX/Xu76cSuV2kNGnRv7lXsy2/
	 pgMfqQ9JVlrSgah5inXKih0CtwVlF6IuKbUJxKQ8GCqal0/0Ug8/eILZrS8utNc7zJvwz
	 X6dutiuqlXcZW03ii1WVnSgt7kbUZ9yLjednjLJJDuuqaLMb2TTFDaPMJiM7uRDptsYPX
	 WUJhdgP89OHAId3DG0WD4P1GCVBrDBgU8sG9ngfR4P8MSG+cqrXUAl8tUypKhoEtXFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaFncKf4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5D606A31A;
	Sun, 15 Nov 2026 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eaFncKf4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FB5B1F000C4;
	Sun, 15 Nov 2026 11:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794740728;
	bh=QArUHYLf9L/U2NYw1vy2o+lKGGFsWVtZNi4VVFga1WY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eaFncKf4wWRODWaHGhgs3igls61PHECBfoS5HHawovAxp9FaxB4w0P7p/RUVudvHj
	 Mds9cJjaEH9OAm6thAqS5qhStI/kRJYq2lSP7o2QljI3+05JHi3u6uW5XABXfkukif
	 Dnldr+8wKAS5hrCjVlIDVwIefoMPufHhk+yGXZ7BU266KBnhdiEVuJlzFVr9nRgupp
	 y9I9gZIoMpBwzZJWMdAgLw8CNLoM0X9Mj+KmJJd75+izMjfqIGddhcq59miShug+6M
	 98vySNLMnvucxqDS8nqJl96lEVrK+A91DFkzw1+0PcQY6VgIZMh78BSspQsrgid1S9
	 VurZnO6YnFggQ==
Message-ID: <sashiko-outbox-215437@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/13] clk: berlin: add Synaptics clock controller
 helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jisheng Zhang" <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115102401.3520-10-jszhang@kernel.org>
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-10-jszhang@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 11:05:28 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] clk: berlin: non-irqsave spinlock in sl_sysmgr_gateclk_ops
- [Medium] clk: berlin: uninitialized clk_init_data in sl-sysmgr-clk.c
- [Medium] clk: berlin: sl_sysmgr_clk_setup() ignores descriptor flags
- [Medium] clk: berlin: missing .disable callbacks and duplicated gate
  clock in sl-sysmgr-clk
- [Low] clk: berlin: non-self-contained header sl-sysmgr-clk.h and
  unused macros
--

commit a40ea8003017371f6f9b098c53eae5c758e872e4
Author: Jisheng Zhang <jszhang@kernel.org>

clk: berlin: add Synaptics clock controller helpers

This commit adds configurable divider and gate clock helpers for Synaptics
system controllers along with an MCU system manager clock setup helper.

> diff --git a/drivers/clk/berlin/sl-sysmgr-clk.c b/drivers/clk/berlin/sl-s=
ysmgr-clk.c
> new file mode 100644
> index 0000000000000..f3cf921fc3c1a
> --- /dev/null
> +++ b/drivers/clk/berlin/sl-sysmgr-clk.c
> @@ -0,0 +1,241 @@

[ ... ]

> +#include <linux/platform_device.h>
> +#include <linux/version.h>
> +
> +#include "sl-sysmgr-clk.h"
> +
> +#define CLK_EN		BIT(0)
> +#define DIV_CHNG_EN	BIT(1)

[ ... ]

> +static int sl_sysmgr_gateclk_enable(struct clk_hw *hw)
> +{
> +	u32 val;
> +	struct sl_sysmgr_gateclk *clk =3D to_sl_sysmgr_gateclk(hw);
> +
> +	guard(spinlock)(&sl_sysmgr_gateclk_lock);
> +
> +	val =3D readl_relaxed(clk->base);
> +	if (!(val & BIT(clk->bit_idx))) {
> +		val |=3D BIT(clk->bit_idx);
> +		writel_relaxed(val, clk->base);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sl_sysmgr_gateclk_is_enabled(struct clk_hw *hw)
> +{
> +	u32 val;
> +	struct sl_sysmgr_gateclk *clk =3D to_sl_sysmgr_gateclk(hw);
> +
> +	guard(spinlock)(&sl_sysmgr_gateclk_lock);
> +
> +	val =3D readl_relaxed(clk->base);
> +	val &=3D BIT(clk->bit_idx);
> +
> +	return val ? 1 : 0;
> +}

[Severity: High]
Can taking sl_sysmgr_gateclk_lock with guard(spinlock) instead of
spinlock_irqsave deadlock?

clk_core_is_enabled() calls .is_enabled from process context without
holding enable_lock and with local interrupts enabled (for example via
clk_summary_show_one() or __clk_is_enabled()), while clk_enable() can be
called from hardirq context:

clk_summary_show_one()
  ...
    sl_sysmgr_gateclk_is_enabled()
      spin_lock(&sl_sysmgr_gateclk_lock)
      <hardirq>
        clk_enable()
          ...
            sl_sysmgr_gateclk_enable()
              spin_lock(&sl_sysmgr_gateclk_lock)  <-- spins forever

sl_sysmgr_gateclk_enable() needs guard(spinlock_irqsave), while
sl_sysmgr_gateclk_is_enabled() only performs a single readl_relaxed() and
does not need the lock.

> +static const struct clk_ops sl_sysmgr_gateclk_ops =3D {
> +	.enable		=3D sl_sysmgr_gateclk_enable,
> +	.is_enabled	=3D sl_sysmgr_gateclk_is_enabled,
> +};
> +
> +static int
> +sl_sysmgr_gateclk_register(struct device *dev, struct sl_sysmgr_gateclk =
*gclk,
> +			   const char *name, const char *parent_names,
> +			   u8 bit_idx, void __iomem *base)
> +{
> +	struct clk_init_data init;
> +
> +	init.name =3D name;
> +	init.ops =3D &sl_sysmgr_gateclk_ops;
> +	init.parent_names =3D &parent_names;
> +	init.num_parents =3D 1;
> +	init.flags =3D 0;

[ ... ]

> +static const struct clk_ops sl_sysmgr_clk_ops =3D {
> +	.recalc_rate	=3D sl_sysmgr_clk_recalc_rate,
> +	.enable		=3D sl_sysmgr_clk_enable,
> +	.is_enabled	=3D sl_sysmgr_clk_is_enabled,
> +};

[Severity: Medium]
Should sl_sysmgr_gateclk_ops and sl_sysmgr_clk_ops implement .disable
callbacks?

Without .disable, consumer calls to clk_disable() and late boot's
clk_disable_unused() cannot gate these clocks in hardware, and
clk_is_enabled_when_prepared() treats them as enabled by .prepare even
though .prepare is not implemented.  In addition, struct sl_sysmgr_gateclk
and struct sl_sysmgr_gateclk_desc duplicate devm_clk_hw_register_gate()
and struct sl_gateclk_desc in drivers/clk/berlin/sl-clk.h.

> +static int
> +sl_sysmgr_clk_register(struct device *dev, struct sl_sysmgr_clk *sclk,
> +		       const char *name, const char *parent_names,
> +		       u8 div_bits, void __iomem *base)
> +{
> +	struct clk_init_data init;
> +
> +	init.name =3D name;
> +	init.ops =3D &sl_sysmgr_clk_ops;
> +	init.parent_names =3D &parent_names;
> +	init.num_parents =3D 1;
> +	init.flags =3D 0;

[Severity: Medium]
Does leaving struct clk_init_data init uninitialized on the stack in
sl_sysmgr_gateclk_register() and sl_sysmgr_clk_register() pass garbage
init.parent_data and init.parent_hws pointers into devm_clk_hw_register()?

clk_core_populate_parent_map() reads init->parent_hws and
init->parent_data unconditionally when registering the clock.

[ ... ]

> +	for (i =3D 0; i < gclk_n; i++) {
> +		ret =3D sl_sysmgr_gateclk_register(&pdev->dev, &priv->gclks[i],
> +						 gdescs[i].name, gdescs[i].parent_name,
> +						 gdescs[i].bit_idx, base + gclk_offset);
> +		if (ret)
> +			return ret;
> +
> +		id =3D gdescs[i].id;
> +		clk_data->hws[id] =3D &priv->gclks[i].hw;
> +	}
> +
> +	for (i =3D 0; i < clk_n; i++) {
> +		ret =3D sl_sysmgr_clk_register(&pdev->dev, &priv->clks[i],
> +					     descs[i].name, descs[i].parent_name,
> +					     descs[i].div_bits, base + descs[i].offset);
> +		if (ret)
> +			return ret;

[Severity: Medium]
Does sl_sysmgr_clk_setup() drop the flags field from gdescs[i] and
descs[i]?

struct sl_sysmgr_gateclk_desc and struct sl_sysmgr_clk_desc both define an
unsigned long flags member, but sl_sysmgr_clk_setup() never passes them to
sl_sysmgr_gateclk_register() or sl_sysmgr_clk_register(), which hardcode
init.flags =3D 0 and ignore flags such as CLK_IS_CRITICAL or
CLK_IGNORE_UNUSED.

[ ... ]

> diff --git a/drivers/clk/berlin/sl-sysmgr-clk.h b/drivers/clk/berlin/sl-s=
ysmgr-clk.h
> new file mode 100644
> index 0000000000000..5ccf388bcccbd
> --- /dev/null
> +++ b/drivers/clk/berlin/sl-sysmgr-clk.h
> @@ -0,0 +1,44 @@

[ ... ]

> +#ifndef __SL_SYSMGR_CLK_H
> +#define __SL_SYSMGR_CLK_H
> +
> +struct sl_sysmgr_clk_desc {
> +	const char	*name;
> +	const char	*parent_name;
> +	u32		id;
> +	u32		offset;
> +	u8		div_bits;
> +	unsigned long	flags;
> +};

[ ... ]

> +int sl_sysmgr_clk_setup(struct platform_device *pdev,
> +			const struct sl_sysmgr_fixedclk_desc *fdescs,
> +			int fclk_n,
> +			const struct sl_sysmgr_gateclk_desc *gdescs,
> +			int gclk_n,
> +			u32 gclk_offset,
> +			const struct sl_sysmgr_clk_desc *descs,
> +			int clk_n);
> +
> +#endif

[Severity: Low]
Does sl-sysmgr-clk.h need #include <linux/types.h> and a forward
declaration of struct platform_device so it is self-contained when
included before other headers?  Also, <linux/version.h> and DIV_CHNG_EN in
sl-sysmgr-clk.c are unused, and sl-clk.h uses u32 and u8 without directly
including <linux/types.h>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115102401.3520=
-1-jszhang@kernel.org?part=3D9
