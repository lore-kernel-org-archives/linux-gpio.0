Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B64301C8
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773132140; cv=none; b=C/FMV9GkKmJngRRcJb7GyPPrdSv+ZHs2Dg+L/H1V2Ajul+H9LBNtPd1OaxqZsiMHlFT0rKBYD7fc0KKdj6XfuhrDfSFIuwIJdatlRWdMnfgxeHUAq5ULGANhKsK/V6IwpjzhVcYZWQN3oRiqi8adAQTd3CnXY+NtZKi5l1mQWtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773132140; c=relaxed/simple;
	bh=+hdxOVwm077ylsjLu0wR0T6SVFeW4T69FussqsDDRHA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNe4no7rUWWTEn+TeqWnHg6W8KAcZ7tXbMdkzn+Dd68tjATDc2y+FAUfibpdUN7WOhwoOqFsFbv3XbmEOwxL3y7VmSXTdpjjYnjsQyUwiJPwHk/Szd+RrfGhB/XDas2Xze3hr8TnqohagS8Mh6ao3tw/gJJRq3dS1PaB1m9usbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aePTidg9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aePTidg9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8557C2BC87
	for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 08:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773132139;
	bh=+hdxOVwm077ylsjLu0wR0T6SVFeW4T69FussqsDDRHA=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=aePTidg9Bz1yTy2ku+kjn/HYuz6KSoj0QtUj50D8tn70dPp5I9zoO4+Vkb8o6i2It
	 Bk3D+xzPlixi+5b7WmIcrN//xFCTUP+vvjzeOy8uhtxyGzgXw+ZiLAkS01YUctq5sJ
	 P4nQJ3qop/n3XDk+tkYw7URlP0DiPl1XJutHkpo4G6HtDXjAotIdALxZlV2ZijHkSO
	 CTJM5UKhwhnUCd/vfdF6F/wuavUr9XXubEn4omOgDC2iJh9UYCMB2SwENQQWYsrTcW
	 D7hav79NIEfxCYJFHq335NAsa5XAiKeZ2jCS6ET3YvLHfT/flFE0sFu38LW0Ulp+98
	 ceW2GexPq2ICw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1443780c4so2867911e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 10 Mar 2026 01:42:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXYLH91kl0zLH3kAauBRr+Zo44JT3dTLAkCxDQWqtlSPB+MMbyiNuA5qBB4+oVMiCOT8XddfAWqkedm@vger.kernel.org
X-Gm-Message-State: AOJu0YxHA+RFPZbYw/WjMxPKBWx87/DXeYKJyXCWV4cJ/99t5bATBwkL
	mQHHTbCd1iOmocgYKGtckIU5Ix16ZZfk346/vtxZnpb1PcDgpfNdtq8Fav4hqBtxAURx0kRiHbp
	S0ipCMRNziP7YZDWfZt9sxMnubbkalTU=
X-Received: by 2002:a2e:880b:0:b0:388:4329:c054 with SMTP id
 38308e7fff4ca-38a5d04ed61mr6094121fa.15.1773132138304; Tue, 10 Mar 2026
 01:42:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309190842.927634-1-vladimir.oltean@nxp.com> <20260309190842.927634-22-vladimir.oltean@nxp.com>
In-Reply-To: <20260309190842.927634-22-vladimir.oltean@nxp.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 10 Mar 2026 16:42:04 +0800
X-Gmail-Original-Message-ID: <CAGb2v649jsoT9Uw5=gg5Zzxmgd4E04f8B8St_vUseP3JOrGG5g@mail.gmail.com>
X-Gm-Features: AaiRm50ffNFGTkd49hJolMVvUoYaIAAtO7JRlAyrrCfXMo0y-iPLjdkpqATmeN0
Message-ID: <CAGb2v649jsoT9Uw5=gg5Zzxmgd4E04f8B8St_vUseP3JOrGG5g@mail.gmail.com>
Subject: Re: [PATCH v3 phy-next 21/24] phy: include PHY provider header (1/2)
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 3:10=E2=80=AFAM Vladimir Oltean <vladimir.oltean@nx=
p.com> wrote:
>
> The majority of PHY drivers are PHY providers (obviously).
>
> Some are providers *and* consumers (phy-meson-axg-mipi-dphy,
> phy-meson-axg-pcie). These are the Amlogic AXG SoCs, which split the
> physical layer into two chained PHYs: the digital layer and the analog
> layer. The DSI or PCIe controller interacts only with the digital PHY,
> presumably for simplicity.
>
> The rest of PHY drivers which include <linux/phy/phy.h> do so because
> they call phy_set_bus_width(), a consumer function.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> ---
> Conflicts in drivers/phy/canaan/phy-k230-usb.c with commit 8787fa1da603
> ("phy: usb: Add driver for Canaan K230 USB 2.0 PHY").
> Conflicts in drivers/phy/eswin/phy-eic7700-sata.c with commit
> 67ee9ccaa34a ("phy: eswin: Create eswin directory and add EIC7700 SATA
> PHY driver")
>
> Both drivers are newly added in linux-phy/next and not present in
> v7.0-rc1. The recommendation is to drop the changes in this patch and
> readd them when merging into linux-phy/next.
>
> v2->v3: add conflict resolution details
> v1->v2: split in two parts to pass through linux-phy mailing list
> moderation
> ---
>  drivers/phy/allwinner/phy-sun4i-usb.c                 | 3 ++-
>  drivers/phy/allwinner/phy-sun50i-usb3.c               | 3 ++-
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c           | 4 ++--
>  drivers/phy/allwinner/phy-sun9i-usb.c                 | 3 ++-

Acked-by: Chen-Yu Tsai <wens@kernel.org> # allwinner
