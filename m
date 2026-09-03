Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1845F36B93F
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788425561; cv=none; b=UBi9OiCMOUxoNPtXrsGZtskufvymM7IWp6yhlZXl1rBBn2+QqsdnjkHY3u+coIvztgTCgufZnjB/ztNqAABoq4eY4T1tLmcQpmn/mBY87avvcRmDMclsJTMk4UU/VDNf+QKqPYPazFrm4h1Gdx9WbBWYC+Bas+l8nq3ExSXy+FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788425561; c=relaxed/simple;
	bh=nCjep19YpVy7ptXJy85uM8qZLDh2PaaoyCU7UFW2ucY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sIeZsJ2GZ4yr+WGrbmSziMkFH2IjMds7Ca97V3b60nfZKmPv0dtPDf/fpZdkeKYOae7ju+TKOQeBHj2PYn1JrW/1tAimIKfBnuKT7l0+Ew6xtolVPmhcTL4XXC8DhKlxFccxJU/c7uUkbVFYolZ4nJ+C0Mz4ce7+BTXAxiXfCEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-78a220b5778so767683137.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 01:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788425559; x=1789030359;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=C4rlCOn37h5gJZpVKAKNeNVZ0qRLT1DFUGwUmbfCeTs=;
        b=cna86dgPBJZaEO6DJcZKHBs5eDflwT5zuGznzJmPEvGB4ZMZbfofi/RbFrCDEXyrCa
         wt7gSdOgAmPczAG8EV0peuKEaX0UNFC6UCuXAtVt9CzoGEPdxFvOhrBCQMl7W4w5kkIl
         j7SMSr1Dy/6/FsE9nm7ppbCWp0nd79NWK48nDLqyKTMGTrv9855BHn0VmzdFism5E3y9
         6VI4xsrIExzfv3PQC2B2miGK+BEmSbG1fhFP9zA74rtoHG6Mx165wbsgdJMlw+x0Pe6H
         fHzU8CxoU5HdyOQHwB4MZgDMbws4AKiWYJUzVX24UCXUj4EhQ+mo0MDNTKH5vGWtUYUb
         diog==
X-Forwarded-Encrypted: i=1; AKwUvBzf7dyl7rQJXObvwCcZUZb7ZSU+kJdxhIk9RcXAr6IEfb5x6XFinYCkAHdIFBNndEMQpWj+1oS020IX@vger.kernel.org
X-Gm-Message-State: AFuF++lxMWq1qK0fbWw6+eUkVNtFf3Wq/OXy9xjJMq8TqgmeGlrIWk5+
	TPhe/PrvL1Ka7shArpBftbLewsk703CZmWyufXLsmgCLQ/za0f0o+yGVSYHTcYgvN/U=
X-Gm-Gg: AYBFou3E9mzzb6IkD3KK5fWeR2JI84DmbZmxP3sY4e4W9QKbJwgELa6GlpJyxvhhXmi
	DwIKYUW+Mzveq/VKsTiiurfKM2cBwN9eujnwTrIc0tiPSFUcb81CDfBEsfZqpaiBc1nD621mZxh
	5qWE8gqECeew6RBVw4yHYJOHSFdFsnnuCnhwBoNT3o+shoyDA5n3fi6itiG5DhI3rBrEmGNlcz7
	Lqyb2LD8L/alGPoCywQK4jbs7FmAozTA6+IdxUsneEwTxgKpUWLybGk5Lsa+3bjqVh2PrIA5L3Y
	CyNbxcd1TEy3Py9Aok25TDSTu0AFyPk1M1e7rCKVDA36suE4NtOrhsSxOxyCKfZvbI1rSa7RMWk
	VwcZyrjNTlEPGtmoHVGI+cmPdDOcKd/AExF/lrNsuwAQwkLBSTok35PA/8mksaNlqNvkB6d8rqS
	DJS7nPxoceCYaCi+isErjPc0blRGhJA7Y5EKLxd2CiCUQgwR106Q3Sj401seHWJyygaXR1tuoxA
	v0Rt4s5kK94A2KJy1zS1T0bcy/k2MJG58h0
X-Received: by 2002:a05:6102:8345:20b0:777:2e1b:1e2e with SMTP id ada2fe7eead31-78a2ed7ca4fmr1058066137.3.1788425558923;
        Thu, 03 Sep 2026 01:52:38 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-980672b95casm3996599241.4.2026.09.03.01.52.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:52:37 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-977ba4d3b49so609657241.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 01:52:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1KAEULpUFVtLdPF0n45Z/8HmDOvQMYtuysDVZb7TPQ3PlWAhzj4kpR5OkcqfuwnDa0fGIyC9TlKg7@vger.kernel.org
X-Received: by 2002:a05:6102:84d9:b0:778:6695:2f71 with SMTP id
 ada2fe7eead31-78a2efc74e0mr951843137.15.1788425555897; Thu, 03 Sep 2026
 01:52:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
 <aob6pW_BQbW_hF2e@ninjato> <aovmzeyXAQtb063B@ninjato>
In-Reply-To: <aovmzeyXAQtb063B@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 10:52:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
X-Gm-Features: AcwNN1V03wVoMTHnfOLNCqV0N8TGrKgNMWk4P9bpEKw35T0AC3SEfctOY_5pVKE
Message-ID: <CAMuHMdWYg-QhMZ9e0i=Nzym7-8fcFfahkTT1HKwxQ4d=_0YDng@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] pinctrl: renesas: rzg2l: Add support for RZ/G3S I3C
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, linusw@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Mon, 24 Aug 2026 at 08:38, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Thu, Aug 20, 2026 at 03:01:25PM +0200, Wolfram Sang wrote:
> >
> > > Changes in v5:
> >
> > Tested with my G3S + I3C setup. I3C still works, I could also not find
> > any other pinctrl related regression with basic testing.
> >
> > For the series:
> >
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> I'll reply individually again because patchwork doesn't pick it up like
> this.

That's why we use b4, right? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
