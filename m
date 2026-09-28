Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914AD502566
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 22:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790633269; cv=pass; b=t0nM/spaC49UQs7nzFclT8HtKDb0oWQdGnLqR0ANyoRSdpsKIQeRJQ1YtRLvIh9Q+gWYV3dkP6ocPIU3Ws8TzX1PCMiIMctQE9TmqIwZ1Yst3bMdF9KiLzlZPoGfendwjV2+xOf4VJC3x8OvW51wfGoXXFoWTQWXfLEBgPvrcIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790633269; c=relaxed/simple;
	bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQn89jvXt3R84GCTMQ6ilLHMbw10WbTlPVXBO1ytKQvzWeFqlfrQUKwxdS3bl8VhWOp6rcro/bJFG1u1tJm9WoETRtqPzmDEUYvutLZq7bTzGFxCnNGp8jGIjefFQ0qIFwLVcDcKCEWEF8CcUh68blGIezVnFtOEDPiNx0AxLr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5Skv06P; arc=pass smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5Skv06P"
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79028ca9371so1239762137.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 15:07:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790633266; cv=none;
        d=google.com; s=arc-20260327;
        b=kLPGJNTKC8ljoPgrQLXsfMe02Xrpef/S9iRRrrO9TfH4tMWSauMVIOXMxhi4ZUgMiK
         dZcFrZIk7vL9G2Kix1Ct1LmJn0HfqbVterbgcQseUv2ojs5TX2tLUJVpSVXmj+NPuynH
         s+ez/GaADxEIIfbCTOSrDxmWb8wSE97v9MLNyy03085JvGGp1TYxzttFYTZ2DNM7/IxA
         J0jR66QUaxkj289tzo/F8rixzqwoyEttqwkVgSqSgjbYBHopG+Zog8dp/UD2gGlnwu7l
         m855NciBZCht9dfuZVjaeiz0A9oeapuOT18R5R8kENLV/Aygm2sIMwW4qDuRQX0l7ACG
         D8Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        fh=MLL1Lc0PO3jyhZ06sd7XYbuAoGx94O+8uvTBLaOmcIg=;
        b=HuJp1KcvqS+oKiVUIAWpJyIoZgVhXK1S30OrCqZBbIzh22iEgQ14vRV5/Sb7jFo7HD
         YlcIxaZ/mVO3lpRHl9loD7v0eNnmKO8n+IKs448Cqxw1JSBxd/uDV0ky/ed4imfvAIYO
         WyhZ4we5FShSLB2OMsw3YNya1EPg8ztNGrjnyJ4rKqhcZ+iTJQ3qGofh+i5g/C+eA1S7
         hpV93t0R2H7ucdh27Dnl0fc10x+rY2zixFidqW2UIBlJgEhz8yRqvX4atgRDRGT+JEvG
         G71edoPNmnkRtGamlIWVvaxgrwuKh2lslMSARhcUTITzypofSrG2IHlOO990QELv26Qw
         edgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790633266; x=1791238066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=I5Skv06PdP80elAdgEOkV7u7P5IFmWePOSv8be9nurQoyTIkpv8H94neikY8rZnjfQ
         4tqVeM3HgJi6ymwkm46Up929kx0IfhfD7GXz14YOnlTl71KbU+jbi6p7UNwgoiL5dzki
         agiJ8kgWocCor3z31dPAAeS7DiTk4FPj4P5GQv0Nm8pD7jCtrUWmy1jxo4dqkJsteJLJ
         tP5zcWdJYFjnus+viEBajEGX5GHO8mFanZKdnWONKEMpmneGcAx2BVfpdQiUeNmU+FjU
         QavbkDL670yrFJBBSMnDDTy9nDoJvrn457jJQsoUZHW04B7BXerbwwpHgOYdBnT/JM8d
         h8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790633266; x=1791238066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+BryhTGoiN9HbpqdQW7fneRPfw3ZcJwzXwJqqFDDUAg=;
        b=gkt+WdIpeyKcfKO/h7sVd2ir35/2ZkFLS1/6BXzvWFBVLpjzLLaDkVGrZPxtDsJRHI
         BL5K/OJrE2ck4X0K1X/A6v5aJ6To0ldgOpharLJJGXYPkFOsfb0/WmV6st0oszj79q83
         39IgCUqA+1xWzyIUf7X0l6k/xy/tSP9FwsI45UfCvUc48yCkGOomcBnJpSdqXwt+rDqT
         JixjIjQocuqd6alxClTPkow99Lr+u54OtArnW9rVML6V1KIUJyVqDJKmpVXhhA5LtmdF
         kF0Pc0kc9KwGFsx9ECd0xQms0oAOpi7ptzI/h68DVCq9/YfkVrMmk/61OLxTBzvHQEuk
         tgpg==
X-Forwarded-Encrypted: i=1; AKwUvBypveRYwuE271Eo1YdEUZr1MtchbqgE/fDXi4N+ChhVd+n9vkp2it8HXiVbJ/Vu3TA2FHXkd9Em/fkr@vger.kernel.org
X-Gm-Message-State: AFq9FYJCjLUG6RvWmxL2w0AoWMwNsVFEusMtveG3v1fJp6E9h2CuInoY
	xYEG2/ckd2ztEYjm92QNCT8ra/ZnCNvddwqyCTE2yHVyPNmVI9K8fDvzff6nrKOFRuoIxPQ+/ly
	tEq0lN4eXLMuzvRj9dio3X+M4viZ3/D5aSRBPQYdN
X-Gm-Gg: AYBFou0B/pZrgDPRzrc/irUNzxJa6ICdkw5RQpAldxZ5AP6HrugpQLp6HUCksXImaNC
	SCfEj6E6c/aS3HOZvPp7fCSNPPaGYMF6UK8NmXSrTv4rn7MpGKLP6mgaOEjwogkw4G/VDbgDBRj
	RLOr3yhev4kgS5KAtk9YbRTodRS+MgNwijpb/uwibSPvt7YVcvz9AxrIjtDJmpBBKa4aVivfHpT
	grdOGLE3yoOzd3ylvZ7A2R3L1sOnvQ01CiRiNadxPdob9QEGaZg5gZnWtun7aJQC5t61y2IrW50
	V3296VlCUi0AhjDkCL6sNuz8iJN9H2i4SufOCIhRfWBsymZfuQII9SAP4CQ2d6W8qGJYz9AyT7z
	pPkWpvaCBvA==
X-Received: by 2002:a05:6102:3f0d:b0:7b3:4199:2de0 with SMTP id
 ada2fe7eead31-7b341994431mr2105212137.4.1790633265847; Mon, 28 Sep 2026
 15:07:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260927190758.609156-1-nikitash.mariiaw@gmail.com>
 <arrfZ5CYyLt0vwu5@google.com> <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
In-Reply-To: <CAGG=3QVY_OGjSYZgJ8i8Nb-EbwHKPOvZsbqqXfcbv+Vvq_wsww@mail.gmail.com>
From: Justin Stitt <justinstitt@google.com>
Date: Mon, 28 Sep 2026 15:07:34 -0700
X-Gm-Features: AclHuK8nlJeFMJ-63_0sQ49qEkZQmIZd_Mx0rQvc5qKTUPlWeM5glCx-vJub4Og
Message-ID: <CAFhGd8r_JfpaBvjod+AA6G3BE5S-L8Gs-nc9xMXrxp6_tLOgVw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: Use snprintf() to construct pin bank names
To: Bill Wendling <morbo@google.com>
Cc: Mariia Nikitash <nikitash.mariiaw@gmail.com>, krzk@kernel.org, s.nawrocki@samsung.com, 
	peter.griffin@linaro.org, linusw@kernel.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, kees@kernel.org, 
	aleksandr.loktionov@intel.com, codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 28, 2026 at 3:01=E2=80=AFPM Bill Wendling <morbo@google.com> wr=
ote:
> She's been marsheling some of the strlcat patches I sent to the
> mailing list. It's possible I sent a "v2" of all patches, whether
> there were changes in them or not.
>
> The patch series needs to be separated a bit because of Kees's
> 'seq_buf' changes, which will make some of the patches I sent
> obsolete.

ACK

>
> -bw
>

Thanks
Justin
