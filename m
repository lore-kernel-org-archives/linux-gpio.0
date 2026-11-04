Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823392;
	b=2bgTGdw9j631R9r+ZZG0Bh93sh6QoM2wCTAzoiUXODPgLdz8Fe29zNxt32jYpuhGuTfk
	 uqDTWNz4PBPPQogbpimkwsuIEG6NLzrJrezJpLrxW3jU23eSAMWnpbD5VJXGOXDqE6zFB
	 2UKnj76rm9VGYl4w6ARtkCK/Bz5ZgzRlBOaj7jVba2/dIxI6sznzQKvo064KAnrJnudR7
	 9sGe6qMvJ+56GXcchmoThbFWQM/wAp62Kj8JMI0KFLXq+MmT1Chd6VOWHvdlADyVGV2UG
	 ImDFc/nEduONopvCaZhvSRjDnJLTrHd2uf3aJbOXRz5Lji3cuSPX8iTUkTzFUG7F1gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
	b=GoIipr5pR84WZAhxKcqgfPdJf9lrtCfK9XZ1f2F3MGTdhgZ0GD9STa7EzPNCBlDcHcmi
	 PFJDqXCHkMZoU7UYtwJpKxogCLu5GSRZ0I4x6BRuwP3VejyrAFXqf2KqT6Ind6KEMjNZ1
	 gePa1eUMH/2Y3tGDH5q/lc5CBpBFa/R+zhHfrqmK98HLjvm5XRW2cF/PQfHpulYh04WUd
	 O/5Xixlo2/wEAL6ODIabxCMxKZ3V4M3HJpZR6+ZjzvGxeDxpjq9/lVgn2gOjHxva9Bq+Y
	 ClE0McyRpw+cHHlMbj4B+8oI4lb8B0KFysHN1OIhwp/ixArbicCGb9ea+rtXGDxagkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4B2606D810
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 20:16:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A4B2606D810
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so737810a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 12:16:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823392; x=1794428192;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=foLRpBa47s9ruCMxuyoA6DXIF2wwXVPMOzwICiq0ito=;
        b=hvPrPpNEA8aC9M7MtvYP28b+B+ug8X1AWBu555NdtNv96li4DIHVtYrh/HOEZ1RIUM
         ZZdXhwj3TL5jwVu5fDf1Y18g1S701OKPxYPTkbzZ8vIhoruAPoGV9gEs/JfR+ADpMYLT
         J9IPVjPkBwrlhfZ0TwNA4/uNaCHJnzb/H/y3CgPslOZ7851PS25qjGf9Q00WA78YuyXa
         qzTzaVKuPx68+hahknAdPP3GoMoeG0hVsnX5ILphcWXIh0PGXUGOUpSV8Va7C6aPgrNx
         AeVBT5uqxh9/p8HXB2vj+m9bU0qtUe0pGSn7tPEc1IC/uB82VLjK0a6zYCd6DjbLpk2R
         YsUg==
X-Forwarded-Encrypted: i=1; AKwUvBxmia0PaOVPvPups4/kPWpjESjEZHclb932Fqk5BtjUeZjwjz7d/zv3oPd+JkFGq7eLzk5EcOduVIwb@vger.kernel.org
X-Gm-Message-State: APuU4Z8OO8h/0TIgTu0SQqfvRh7Szi31Qeitr8zE0UhGu/6CGsUUmsLx
	6uNeDG5CpMh4w9goLipK9KXKTgXRID1Dq0ZQoVAMu4kPyob/5/YBAknCtIHQaO8B
X-Gm-Gg: AYBFou2b+qk1W9SSDuikd8WvXGvHYCTSznd5M1f7elEm6j9nRrIBrSMOS+mu1ufbYid
	p6FvJtUGuFrr3QB3kfkgyYKjal+LKPdKTnKpObJ+YQubo+afvGO5cdbu+HLjcHcnfme4wrr0huw
	me/BveTc6ltdHTWC1Ci2299HANtxuQKMa4idcjVspLFMr/0HOOeSUwtHBIoJhYCd37rAYEJBBR7
	WRYHRGJR9TxArP2l9+YuyRW7sp0mC3x7xH0z7P25IyeJBx6BtYN0QgL3XNieaOpGLv8GuMtl1zf
	dvoVhx1NG/xq739wjtbH8oc7n0L+K+kNg2TFYW6oo0z6f1lRCYBXopvAiPbder2uiUY49IHocuZ
	B2LmwcZuV6PUV79UHT5E7ljkKy/pnpqsKZ40j5IS06MxZ2t7N1JV/Zzj7ixVFXTvQL0AxbvXeOA
	J+pdapJMU4JiJ2JYv9MjZG8hG5xBUzg/IPrfAYrto8uxV6RXAzgm7+2r/XiUZ/v6ogJCg7KUu6o
	SYCBYiL1H5SEVgKCi4dkZdb9ejw7hLy+qM/e/ewaGS5Fdy3ofYqUeNiyURPp5rsVGcoZ39kshPE
	sEJtHhnhQpjVKRug7qZ0+kMvJMxNUNdLE1IiBPQ6qoc5TCo78yvhC0ylqSQ+24Q/Xs7OiD9E9UR
	YqsYfocRrXxO1pZLgMLdnGQq0lH48qHUMtpKrq+v5j5QkkQ==
X-Received: by 2002:a17:90b:d09:b0:3a8:786a:cfed with SMTP id 98e67ed59e1d1-3b0afc81192mr253558a91.37.1793823391663;
        Wed, 04 Nov 2026 12:16:31 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31601b7sm415218a91.5.2026.11.04.12.16.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:16:31 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a315ed211so1124010eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 12:16:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwybxGru5GcEDAU5/aEQv7YlpBTFGehNf74NUK6eKQyWQBScegLYweJVMhHunMa5VZfX6LT6J1VKtZf@vger.kernel.org
X-Received: by 2002:a05:7300:dc10:b0:36c:a1bc:6102 with SMTP id
 5a478bee46e88-36de0488bc8mr1203042eec.0.1793823390961; Wed, 04 Nov 2026
 12:16:30 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-2-45e463c48728@telaak.dev> <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
In-Reply-To: <bd0d89d16c9effa60088131aa81b6d5786738c0c.camel@pengutronix.de>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 15:16:19 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
X-Gm-Features: AclHuK_OSxtEYlXiOHps7a-cMZJsR_Cw4vnjS7VT6Pg5ApAUwbgB-aNStGUXOis
Message-ID: <CAPY4CJ76e+ij8zPg3kEi_1qNt1gqh2PuJRCTcvQghsAHr2Ft2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: Add Siflower GPIO controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuanhong Guo <gch981213@gmail.com>, Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Qingfang Deng <qingfang.deng@siflower.com.cn>
Content-Type: text/plain; charset="UTF-8"

> Consider replacing this with
> devm_reset_control_get_optional_exclusive_deasserted().
> rstc can be a local variable then.
>
> Don't use devm_reset_control_get_optional().

Thanks, v2 will do this. The binding makes resets required, so it will
use devm_reset_control_get_exclusive_deasserted(), with rstc as a local
in probe.
