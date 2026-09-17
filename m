Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD90E390CAA
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 08:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632430; cv=none; b=dVw/TKYoBHuXGroTjbC1S0nkm8FjjpuuSsJVS6J0H6/2xDDIjcrjdKxeZCbfHGlIDlyGOJTAh+/n1du0JZgLra+OePEZBsettTNyGPXeFy/p/lpvWoDc87xPLJlfY8/V6a9iP/yntTQnpeuM4ojDRVwTu9rGwCTukKhKz8/50fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632430; c=relaxed/simple;
	bh=qf4Z/Wab6W5GL4Sinbl+uCK7C7f+qmxZxKQBDuJWh9U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ae4O/nA8UVWdna13Gw5tQNuajmK84oqAsaQx0lYr+X0y35GwS67ZH/xp7YL2ODWGSmyvVBY29OBxeMJhnjTIuSdVsI6T2UpkYrcvl4nlKyo/fXkb5esFWP8VNk3odjjBk90KQ5ZId1AjQK/m6OdjTkHy2Ru0MHyvjSsDfmcpkB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e52ff5dso377721e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 01:07:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632428; x=1790237228;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jrUfKqIAU8KdEdqG0jEkfz64jh4Vm1/h0EwrowMtP0c=;
        b=kUxO0W+pgQOg8ZWLjSYBxLYaaCPIA1ztrCLyA0YvC/CWYCUNK4J+X19sVyD4QP2F/V
         E6ySpgR9qD8bKSXvD/jYnpcQI4VPRj5jSmJZPenUWWsFU/AB4ncP2VXYCr+AVrtKFFzA
         VZyw218xfrawh21MmOtesbWOGNylLQnoEQV5Ink8sJ7G4XPQjzNQOanDpTfsKqcDMsbk
         sQbZ0hQTprlPg3FNSxfJpwoHSboiQKKuc8uvRPs7t3/MZeK9lw7nm6XlDKFlDc3qhy3t
         FzUzGaTm+SCTRAsqm94L861eAARW+xMIg1Z0hA5j42ZBXgntffaEYQKN6mO39OOTkaRi
         K1ng==
X-Gm-Message-State: AFuF++m4S0NM8RfY47yztq5ugzAphipAPRRKc5vS04ohex9M7hsPlIne
	BIv+VBXNp/mYvwENqMVlODlESj1HTcde73xFIxfHiGo1Kdas7BPiP0JCOu8sZ28QrFc=
X-Gm-Gg: AYBFou3C+YidjRgykJ+l+cbTTFenrK1iLkqzCQjZf/gQ+iZnDzf5bZCYO0d5Cp4pue3
	4NkCgWRfwErIdate3uW0GtS6woTAJENob9qFG4h+DR6oR72JNH6P5pCwfe91FQGbSRWM3MRkkhk
	1hsgjJCFx6JNz3E0KU9Jcmz5owqcwF6n6Ij4075WcamkNJyd0ODu9Mnt0oET9Vv9Nx2wnJAAZ7K
	fgZkas/6qoDdSszTx1mGHOAkQHeBzoMN2yPlyCMz+pRWHokkZyfj4ot8+bezaOlenzxPRMgqzIC
	iU+Vr7VI8vw3mNkM4kMOxQxBflpyWp0AHWjyHEZ/3NH8BWcHmdgwk1iNC68/0ZKHMcJXziRGCO4
	u9jtAYAULlaH4MPwKMShSkCUPzAPzqS7INTZm1xsdBK3l//6IvK7b6bFutxfANIlnJEWu3Lly+l
	5VjmeTs8lZz3oIzPmrxL3+8TCei+DJUQHAFKkLnzFzyg3KGdDBcr69UcQnMtWN2x9yz2uNpcfYH
	dqA0MsqSaoRUyKYjjzNYtJJvY1lSUq2mUy1
X-Received: by 2002:a05:6122:328a:b0:5c9:a60b:e5b5 with SMTP id 71dfb90a1353d-5c9a60bea36mr1604882e0c.14.1789632427704;
        Thu, 17 Sep 2026 01:07:07 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9a53e6001sm1949649e0c.10.2026.09.17.01.07.06
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 01:07:07 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e52ff5dso377705e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 01:07:06 -0700 (PDT)
X-Received: by 2002:a05:6102:918:b0:7a1:f951:6653 with SMTP id
 ada2fe7eead31-7a1f9516b82mr1577084137.26.1789632426525; Thu, 17 Sep 2026
 01:07:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917035438.523010-1-marek.vasut+renesas@mailbox.org> <20260917035438.523010-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260917035438.523010-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 10:06:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUKJYtZ=0r2rXbrsTcVyLmVs7m-jGbD2b7CgP_GRMeWdw@mail.gmail.com>
X-Gm-Features: AcwNN1XfAZfrsW2pvaRzJQf-phJcWcSDCPkogzibQkcINXJ4SIBpgbRww5eIOW0
Message-ID: <CAMuHMdUKJYtZ=0r2rXbrsTcVyLmVs7m-jGbD2b7CgP_GRMeWdw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 17 Sept 2026 at 05:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> R-Car X5H (R8A78000) is the first member of the R-Car Gen5 family.
> Add support for R-Car X5H, which has slightly different GPIO block
> register layout compared to previous generations. Introduce offset
> remap table which performs 1:1 remap for R-Car Gen1..4 and a bit
> more complex remap for R-Car Gen5.
>
> The GPIO block register offsets on R-Car Gen5 changed and the change
> can be divided into five groups, registers which remained at the
> same offset, INDT register shifted by +0x10, OUTDTSEL register
> shifted by -0x34, INEN register shifted by -0x38 and the rest of
> the registers used by the driver shifted by +0x70 .
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Bartosz Golaszewski <brgl@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Linus Walleij <linusw@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Rewrite this into a table look up
> V3: - Use enum gpio_rcar_reg
>     - Drop the IOINTSEL initializer
>     - Drop REG_COUNT
>     - s/int offs/enum gpio_rcar_reg reg/
>     - Make offsetmap into two maps, and static const
>     - Use C99-style initializers
>     - Drop BUILD_BUG_ON
>     - Store a pointer to the offset map table to use in priv
> V4: Rebase on current next-20260916

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
