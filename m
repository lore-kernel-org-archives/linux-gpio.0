Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA25412261
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692463; cv=none; b=aNvACy96kmJowNcw5IeSSKrJUONvdKY6L4Go8kA8XdQV54YllXHkngBSvrlyHNlsCIQO4NjD18Wb3RcEdNtdkQkAUaX7SGQTvgE5hkwwgYPyFSlq4/088Fxp+oMqY8Idmg2dMr7fseiMaidV7vM1g6RvYlzE8EcijgowOZ1D238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692463; c=relaxed/simple;
	bh=xyKP6Putv3tmzHtUMFf82Ds+RcboqzTfe9uuwVS2J4Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GTh1AWtBUkjCFghFKKT6wTdeiP8atgl88/SCC34yCyfbqwMBdIzA+CtzHE7wYieVkMQTxlhgt7i2Cfi3pYRtKfOwneTrfjsVkUBoLhBGmX7rGtNocsBYkZJVTujZIIXoa6w7mH5Fm4N0yt1ilIRf1Yvp8X8xDKWJlVumzWaD3I8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nV0Vr8rK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nV0Vr8rK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0B31F00AC4
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692459;
	bh=xyKP6Putv3tmzHtUMFf82Ds+RcboqzTfe9uuwVS2J4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nV0Vr8rKixrc7XLCYkFLYbGQe3LzGpP9V8w8D5n4wn6nn1lr4bfCnM+4joUTHydvj
	 ctvAzKgI9/ffkRMPM07TcQN0AaxI/lGGlYYiriB9R/ozi4++PH1sAtiPJY/CTG3+eZ
	 52yiwq4n7R3qYDQ/NxYwOz4i37uZfqhwiHYmw0gfcCuvyPMHmCt0WWSPtRIB+oPfPt
	 FJqQfu572f6HdRS6rPw6QtNJG3MlDLHbDyBqr4L8GUrtKzyt48bL24gG7NSdkpSpeB
	 /A+GqY1ifun+84+MKOUq/4r+6sJ9bJl72y5NdPsjNDn/E5qyEAYT//fdtK2LoHNOi/
	 jngJ+PmHP5Lrg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso711157e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:27:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrYlASexX5PqJui0Wh6o96HODlZ3M8ijrvYFF3mu8r026pWiSeOVDEKRSTKLlBKxLSBLCgkCGb9axdp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxucyl7Sni2dq+H0P1H4X90Zw2xp7F0BOkDE0CGCrZoasHcu1VF
	AF2LvPMKe5Fcl6bms4kwPVpm0e3Y2zgPl9RVG4usSOLd+58HV5gqxf59l/+gYtiBBOxfXXoJbzL
	k7i/mMTy7OyTfp4EC0mLCJeV+o4Y7l00=
X-Received: by 2002:ac2:4f0c:0:b0:5b0:eda:de1b with SMTP id
 2adb3069b0e04-5b45915d0f8mr454029e87.16.1786692458453; Fri, 14 Aug 2026
 00:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260812015915.3477180-1-eleanor.lin@realtek.com>
In-Reply-To: <20260812015915.3477180-1-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:27:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnoWYL6t7Kyi7nvgK_O1_vyhePdarEx_YyaWM15KmEP9g@mail.gmail.com>
X-Gm-Features: AcwNN1W4Ao2WeU4jPuP_3kUFjoCr1fSiFapw9L5LmScbnASe1Z3Dl4QdVCKKviI
Message-ID: <CAD++jLnoWYL6t7Kyi7nvgK_O1_vyhePdarEx_YyaWM15KmEP9g@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: realtek: rtd1625: minor fix and cleanup
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: tychang@realtek.com, linux-arm-kernel@lists.infradead.org, 
	james.tai@realtek.com, linux-realtek-soc@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, afaerber@suse.com, 
	stanley_chang@realtek.com, cy.huang@realtek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2026 at 3:59=E2=80=AFAM Yu-Chun Lin <eleanor.lin@realtek.co=
m> wrote:

> This patch series provides two minor updates for the Realtek RTD1625
> pinctrl driver.

Patches applied, thanks for your persistent work on this driver
Yu-Chun!

Yours,
Linus Walleij
