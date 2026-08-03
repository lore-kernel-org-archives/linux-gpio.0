Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79D2EA498
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743727; cv=none; b=lOBvnIu6Co0ru6P72GKPjFYxTeNoBNht4I8V5u1bxEbsgHY8lg1bIXmlKfGcCbiMDB41kNkrXDR5h0B9f3nuYuY5KzE8XNUJIbTTe1/W2AsQMt7LG9KFLXNkRS5I97bzkq26GxledhlwHOJ/2GFDESyvwDgd5YNTUubEcMplB/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743727; c=relaxed/simple;
	bh=epolSf7q32++ypoxJpjFfLBqfrUj4L5q/+nRJ2O+U6g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HLIJbM4DPB9FIrfU2mLGQNzKxDH6Se2m6hOqSK/ZrMBukHX8fZDqcwJ+Ndj1AdHyz+USIATVSgBJIf9kZ/iBH9hDGY7of7pRHsngyRXcvLSy/PwdDwsA1VCHPszxyjqpf2FuK0kSD2ZbH3z8MBpLBgXpyQdzbegrYgeiyTulo3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cCTmdMFQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cCTmdMFQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 559761F00A3A
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743726;
	bh=epolSf7q32++ypoxJpjFfLBqfrUj4L5q/+nRJ2O+U6g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cCTmdMFQTOPJz/XKNM+gqZhqPeSk62LDpymfxEfVvZXExDk0Zd9iOV14phvbhVidL
	 /PYloz30xPp5GRDueJzrYQnFdkqTnhZSSzqo55xlicS1KDNO4AdMLOtxEuZKo5tQqP
	 MrClV605o0Mu9VYsb1W+ztWh5Q56G8lREpg6xoxdztJhxQ1NtS+M1/Ir6kYtEJoYS0
	 3PE4r1sB0zJ8aOhZV4pQWzKI0fsI4Qb7UycLcm7Oqs3rgKGn8xqzhZs+Ze09zrGnaU
	 hF1vR2K1tFpudtNRdUGSxtYFK6CcUS1cNsPpJ/DBO9YpFb4kfYzOWHECpzb2njMTxL
	 mO1/h+p4Ch10A==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39dbe684115so36667681fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 00:55:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqG1LAhVQ53mPY8RPcmVmHnCClK87hl4ADX2eiXmYqBZIWlFYqwFj9Y498Bo+HstkHEaJJqaVvxwXTM@vger.kernel.org
X-Gm-Message-State: AOJu0YwrrKP7CrlxxdWKswTHsOsIfHVaTQMpuxRnA/IgR3oI4fFVCvnT
	jSX7tH+ihbwhWtJ7d2pOmUfxfP2Hx4J4HAPzpWHCZFW2Z4Iu7ksFNYm24WA/rPHfUV8q5fOv/LA
	7P9WPFIi2+fjDT4qMIgyapDJAXx2AqLE=
X-Received: by 2002:a2e:b8ca:0:b0:39d:560a:faa with SMTP id
 38308e7fff4ca-39f7eaa5c8cmr20857701fa.16.1785743725143; Mon, 03 Aug 2026
 00:55:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730075501.7653-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260730075501.7653-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:55:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-+w8oW0TMih0mwtMBQRwEktAd72BEPmjLkLo_mBme8Q@mail.gmail.com>
X-Gm-Features: AUfX_mxbJZx6Ao0CfxgLzc7PDN40sgXs3Sk3EhTz6lNk_zYCfH62EtKRPOaI7Yk
Message-ID: <CAD++jLm-+w8oW0TMih0mwtMBQRwEktAd72BEPmjLkLo_mBme8Q@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pinctrl fixes for v7.2-rc6
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 30, 2026 at 9:55=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of Qualcomm pin control fixes for the next =
RC.

Pulled in, phew this needs to go upstream fast.

Yours,
Linus Walleij
