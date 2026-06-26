Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC5C3E51C6
	for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 09:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782465189; cv=pass; b=gb24isQ3TuqrfiCkUKl3v+oQQ3FK0wUSw4Bqu9S87j498i7dzBtX2VHOuDwUzGrPxHlHc0J8PwDaHHLrfdgD0a3Uoy2WmnmVCY4+VhajMtRLMEuE/td7zGLS+/+6fkq/loLKwr129kbHUvMkiJarH8GxypYcYe5UQuF2fDZ5p3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782465189; c=relaxed/simple;
	bh=KbbQR1i7C5wmzlWEzAQ1sdnBYsBTwBeB+CufbfTPiYI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rdfzkhqM3d0GC+n2x0eSQiosjdvY9jz3oZ/MC9knwXzJzG32ab+2yvdihLwl/a89lUfKa1WTblilnqB/Gdd4PPap4K1hQSnGeknuYN++mepNGHxgqzuosZyRaDy+ZaCDUkEs402JBb7QkBlLELjhIteh7Lf5JuDaKbGQVA9x6cE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cx0DSStc; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cx0DSStc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6978f1eeb87so1236030a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 26 Jun 2026 02:13:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782465187; cv=none;
        d=google.com; s=arc-20260327;
        b=iNzr7tLZIQ6VLtmD39x7bI3NkQuXGJRr8tmJfqjwCaDd8A6Mz0r+3iQDpALzJgMqcU
         qSkFLwN5XIInTWFj/0k7FDneAwK/PR4HAQPTzBySyyARSwqsWJM3qZGqCStUR4ofUMuy
         y5H/cvFKpwhV7u+4VZP67Z3lqDH1zSz5zB+lCTwsd5kS3hl8cKIcKHYnkXG7C04b4kTs
         dEi8OfO8zl9v3n2BGS67FRDFO5g9PHNGBNZSm2Kgq6xRwTwoKmNcywyI0hh2mtVWZdMu
         nXYCRlCIJlbR/YpsEN+zPmA4pAJl0w9Dgi3YSKy5sdEI+GTWTQ+86SwtNz9ZlMPlchv5
         koUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        fh=0NePws63sJ68B4g9wwB1Kg1ypvBDe2luMMS5O2kWcEY=;
        b=Wu8iChFDttlb9OH9nAQS1HNS6Ju43ZMNjDel8he6EMYSmVOI2nB/drb2XN5zif2dAq
         gmpBfha89qhMeU5wFe4sRonQv6B7GrUTVqznX5XCgZt+WrwW1Rt7xcDCycxClZBf8V0Y
         KLdYsb02+uz58bFRWq28Qlc/XFaLPgH6IhiAvajxe+CWT+KvtVtMaSTjtaz5UpyNCgzI
         ISERtex3+g8hwMCgBAo4rFmhCnWyxU4OyIgUPhi+crQ3eR9s5AZmdXOuGFqZbmKTn/MI
         g9P+UaivE3JRvS3vuC7RFaczgDt8XmO5epxJ14bDBnYlY0bS8yWM0wRD0+zk570c5sVq
         J4oA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465187; x=1783069987; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=Cx0DSStcLxM8pohUvHSL0GNo8GrjeB4FcwQqIPrLRRrb9s0rP9U3UlHCAcYcEZwLAl
         qOndO8Fhdaxxs4Tfqty/YVodDxXSXakDnDJGbE8XxT9fFzjocJIN7xxBLpFTjIScIjFc
         Swfz+LF24xZXlciA8qdtXYHTv73R/VJeTWG4e4tGd/lXqVNEioJeLTCF4DeSzacuBos1
         lq2e0HFLIHdQghgFyYrdrVViwK7SD5wzCp57ThnvLxmELNE6tEA9kPdqIredpZQIKp4P
         bfeO9q8tdVKtVKd1BEi+EqG8c/vfzvy99fIE7ZonvkJg0qv7Qssy6TRR9TVAHQNNSLB8
         ei3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465187; x=1783069987;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/wSzbIwWiG92EkgcKi5EYZENCnmwssp7G2yc3jCRsI=;
        b=UACu5ckaizwJMVzuto/fb+S8vUejAmF7CZY5FRNIc18qyD7xg/4kVyNrA4V2qv0tEM
         JLSSKN5yIrTEiVrX1rHwwivHXOjYPxBtz2og8RX2t37rZdKFj89b1T17PU/BH2cNF8MN
         DWexcDnTu2YrwGmw/RsBwnIWbmuMP8+5jnVco7oMUwM2isvS5YEbcxOtrY8MQbRzetnl
         Xqj8MV4++sFtpP2Zw5VkYo7BDJiKScc0QWu2z2S3FEcN+kY8cXtTIcwQrkCrQStR6f5i
         2kOqFFnURUrfWaY8RoVJFnotganOzIRySn9Cn+O1TR0M2GsOFxvcE6T+oSiiATLsfSJI
         d7Zw==
X-Forwarded-Encrypted: i=1; AHgh+RqlIeSVggKhlxqeQ07URmMXOrKlC8SOGxTIfWAA57znGs8M8vXqzRtEHAeGkcftkyhAwm1qee76wZTH@vger.kernel.org
X-Gm-Message-State: AOJu0YyjX/9n73uMf+a07RKK4Z8Zq4MmUW3/vphdxzqJKSWMPCvnS8Jk
	W/NTc9+9AEufApYgWqdk/+22Fku1O1su2aAsQT8rb43OWJDBOydqmGVAjy0yDL/Bb9XPBuYTbGT
	b7kZ92XqVQRqQNjn1+CHduFrjb7v5+ehxMYxl
X-Gm-Gg: AfdE7ckiS20Jt9wkiSU0hD57CY6EQchFqu9QoBUjAwa/wxmZyh9lOou/KZzbRnn8EA+
	hjWX/GNTARL6tUjj5Le6iyt4yDCjJrSiuTbrrBQr8/gX26WJ22NfjTUZXRf4tlXTIc7lMkiPXMC
	nwyARicKFGJG7R0+w1Y2dEW3SE1+PmN1Baw3M0j06Aps2uiH69Atjn4lr5j5rIFB5UOIR+3lMk9
	3XskpjmMy2EDjNzgqL1f6NQV+yjqQeSDXFAySbnhdEQftUidwvS3YcTBbNLdsrowVgf6b0=
X-Received: by 2002:a05:6402:190b:b0:697:c0f6:394c with SMTP id
 4fb4d7f45d1cf-69810a44a6dmr1504110a12.9.1782465186628; Fri, 26 Jun 2026
 02:13:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625104742.113803-1-l.scorcia@gmail.com> <20260625104742.113803-2-l.scorcia@gmail.com>
 <20260625-cameo-siamese-cd78c349519c@spud> <CAORyz2JHj7i6VhKom+tVd8PWBjM=TFhbr8-mOy3GH6eDYu4WPw@mail.gmail.com>
 <20260625-unearth-suffering-e2c59d39da0f@spud>
In-Reply-To: <20260625-unearth-suffering-e2c59d39da0f@spud>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 26 Jun 2026 11:12:55 +0200
X-Gm-Features: AVVi8CdLNvDTFf3GfQHOzooYBWEAR15rw8FIdBZyi6PI5TChocrGHW_idD11qis
Message-ID: <CAORyz2L5YuBifG-ud7QHPva+_nyL_SyXMVQ5EeC0s52isc5J3w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: mt8516/mt8167: Move
 compatibles from mt66xx to mt6795
To: Conor Dooley <conor@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> Usually when making ABI changes because something was inaccurate (but
> not wrong to the point that it didn't work at all) it's possible to
> support both new and old ABIs at the same time because of new properties
> etc. This is a difficult one because it's using the same properties in
> different ways. A new compatible would definitely be required for a
> genuine fresh start while retaining kernel support for the old mechanism
> in this case.

All things considered, the cleanest solution seems to be adding a new
compatible, mark the old one as deprecated and also try to fix the old
driver code. I'll try to do that before submitting again.
Thank you for your help!
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
