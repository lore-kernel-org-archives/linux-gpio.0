Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB9C4F30D5
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861884; cv=none; b=onptPYC4/f1+pAGczJOvaqpCqom8k+ifVqvvUMTfes2h2Wti08xk/oTL7uzxAyyIRAnAeZ8g6nTAB6QuAWUh8F0yg4WLvEdU7w5pJczqevBfU+7k6GPDOsmzqbpLYXim8BSWRIB//Hf9TWazRzv1SguXKpC6wL1yIOTbqcWi3Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861884; c=relaxed/simple;
	bh=ghYsKIp07FN1l9ghsOylrYXrt4x8WJ0gtt+77NqonFA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJSq+8Z3kMHbxljJyADcFkUcalRR6k2DPbl0QcglUGLOcq0ixGoMhRS54u91LonZEJI+8TB55+BZAwo6rmtmgCcAObdKIKw8F6Kwm92hl6UAHX/Ka9TCvLIvhp75ojr+aRzm9LXZEuk0Y7XM7VbjN+QxiQAmihb0+pyxVWdHvvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c663437fe5so1957345e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 03:04:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861881; x=1789466681;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1LnrkgW+HhkF2YKwW0WsGcBJcvFVVqkAq4nhlk/AGHs=;
        b=VrjivTrg2DbERRCYTboDc5bjKgMBa/4dlPBk76v0I/S3X36vCooNlRjV+1vLmS2PZc
         h7Q8eO/nkMB3OUQs6N1+KsD+07QGHrbDFCZ3JJvFtsLjbANXM63ZZLRtnpd6lMv15L/A
         ebGXhEMx5MuXn3fqkGH1e1JpsCC+wUCDF1sjl2CFP4iY6kofyU78fydQ5h7MNo6MnHYo
         cofTW4afLFzMZirb0LVMx+7+X56wsL6pJ3J3qydt1l6KfG28k3YOfqLS65c7R7L3MqS9
         DlfdJs1IqDmo2A9ddyv0gK3DMOH3jq1C1qfKyNjqn6ILKM/D5Of1E3TK60qpPvGEXwVZ
         MvTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtXpG5UROkFbrEKfpo9bja/rWtRcCUNkMfq27xQa6Tq2ZckcHBGk+XxwZ2nbHbWDwC8rXYpR4ZC7Zi@vger.kernel.org
X-Gm-Message-State: AFuF++ldq0FoUdt+hCIJyTm50AaOTuO6TcDpv7qiGPPzOk2GytSd1h3J
	5gtFx7OJNi7zNIj4Dd8P7QqQK9AS2EHYZYuFi248NPplNAkHX0aMzM0iWM2MFKTD
X-Gm-Gg: AYBFou2jgo/pHF7Nf6BiyFP+9E2VO6BNtmOUXBdYeUuL4Jra2z7zDgL6rvDKGmG4T8C
	4nXR7bj9Hj4LfXBejfRcLl9tRkdxwcShalZ8+WzGx+X1Keq2efb1tnpo/pdq4YwiLmiI1vVLKCQ
	D9yC98zJMyhGyMZwZ8kpMDLcrT0RnpB33JT/aj+H6K7KFcPiUhgbzFuRKhcAGXfsv3wvgkmBOPX
	L4weMcTSNiGiZVnIui6v5UjnnV04cyb21TGfyKsfr9hys2URT3il3MmnsGaQ5CUUhQ3NM5/Fwk/
	CVAO1cHhjaW2bvEpWXfT9rrwBoa/EJF50x9GpM6yV26JYPS1HBujhkeexYbm8FFAIKK/kOg2n4Q
	qydDsjpN+ZY7VIpEx7SBbO/RAI3tAwHsqKzdgzSLNY+GO+SIPggxM+8t76YKizR8Zp/QoU/ijLY
	CW3f0fxUmLSfio/mAwVlflhKMxw71E2HLHVtcxE2hsClCXsBAJ880OZYXeOEZW4cHR1nYV0qzJ1
	rFLc4tgZIlWzz1ZQPZ7IFEdHA==
X-Received: by 2002:a05:6122:8b18:b0:5c5:732c:f4f5 with SMTP id 71dfb90a1353d-5c7ed4e4296mr12237050e0c.8.1788861881388;
        Tue, 08 Sep 2026 03:04:41 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec386599sm9329596e0c.14.2026.09.08.03.04.41
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 03:04:41 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-7466771f1caso1366024137.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 03:04:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBws29R3EA8o80tGF2XnVpNYfXmubuxe9S+Du/oJyGXfQun1Y2VQEs7zws63gLJj029bhZcr1iGdwSaj@vger.kernel.org
X-Received: by 2002:a05:6102:943:b0:77a:d089:3dd8 with SMTP id
 ada2fe7eead31-78a4aa5a199mr8952340137.12.1788861880753; Tue, 08 Sep 2026
 03:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260817185700.322370-8-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260817185700.322370-8-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 12:04:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6etGuJC5Kg2S0fZGO=gq4HPHVtN2MzfxKTdMVTKsJCQ@mail.gmail.com>
X-Gm-Features: AcwNN1X3RV4SYt13JI31j2zWzRybiv-rSaAkaCpsuF4HrMpzBo7HJkyDeoSaj10
Message-ID: <CAMuHMdV6etGuJC5Kg2S0fZGO=gq4HPHVtN2MzfxKTdMVTKsJCQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] pinctrl: renesas: rzt2h: reuse helpers
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The PMCm peripheral-mode test, the PFCm function read, the PINm input
> read, the PMm write, and the PMm read are open-coded in several places.
>
> Reuse the already existing helpers.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
