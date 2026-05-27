Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061A140C5CC
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779887743; cv=none; b=OldKaXR5ZrhEGUuCnXh4LrdxvYg6DwB3njovFWe29sJMbmQh280XQYYBG2JntBKJtLhM5Ws6SxcDdLLset2isSSToke4/Qmc3JGU3jaUn463uHXMfN6KuZSxKrEvd8FSCeqnULR0zTcZNcIAjtRUvf/B7Xjhb6DTTFEiWwbOtM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779887743; c=relaxed/simple;
	bh=0kBtW3eK/5g2kLvivBtuqbvM+kYyF2/OS9Ez33b5HOA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eimeX2a+ZBeKQXl6z41ngEW6OKGuR1fLh1TolWql5PqZufnE2X+Tg3mwzrcTvvgPTciTE/RKuvhPoB85OtHrGb4zAeEXM0Ejy25KD3DzKkb3cA4WBlp/4zkKjirvXOKI3snpjA9pasGvJTVvdPzNiTmrJPiZ9/l/F1prPqd2iUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRGPurKd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRGPurKd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F4D1F000E9
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 13:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779887741;
	bh=0kBtW3eK/5g2kLvivBtuqbvM+kYyF2/OS9Ez33b5HOA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XRGPurKdDfdIWGQ0RUPsNJ8xhRjyGxAJlYknp6FP2tLICM9P0a9msA6OKbk2YLmZB
	 8btINQ4C3mkJh+QoBQ28wHCscfV8PNb40oacXdjunIV2YKHIbZz/RyPG9WOIT4VFSO
	 BzPR7iWR7+AbAoupdfltmPZDhZFPnZciiNOvYH9X20o26otyMNzGO604CWfZy+RG3x
	 bjzDWZH2zqcHnQVKP1zY37PA8rxSGmJtfV38QXEnGqcPZ7g1YzAg+Y34fthMtTEBMl
	 eTgIBkR8lrH/D4zlOlg0cj9Htqt/P0pwj/+VZcQhWBL5Z5WWG2tSDJJIWmtb8LiXEE
	 N6RItRXQ+G3/g==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8721851e2so13091517e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 06:15:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+rIS5/luRDzuuJMh37g6RT+LEt8oDYxBt0eoWgiGid4xCRDzGYPTyNXTWS85HUWPq1v8t0mfk9QCFF@vger.kernel.org
X-Gm-Message-State: AOJu0YzQXDCeVw7Mo/up5WZrwhd7mvendxg3P+/6IbFTyO2jBVmOnnCg
	1UHR5SoE4bMl6X0fa8q+wQR1qENXTeNT31okZ6TVrVzW61Idxhx1Y0bpVHJJBdkn14S4q8G46OP
	NtX1lv6+arwpzCjEj+t1S9XyMXdavvOI=
X-Received: by 2002:ac2:4839:0:b0:5a4:1add:c56e with SMTP id
 2adb3069b0e04-5aa32328fd2mr4719434e87.11.1779887740531; Wed, 27 May 2026
 06:15:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511183002.228520-1-kmayur809@gmail.com>
In-Reply-To: <20260511183002.228520-1-kmayur809@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 15:15:28 +0200
X-Gmail-Original-Message-ID: <CAD++jL=OfkGMJMsevYRex_85pm=-xMN5-DjbbCgXAXtkfpPjZQ@mail.gmail.com>
X-Gm-Features: AVHnY4JrPo3eLZQHa8Kr4qpK50Dnd5cujP8cExxfw-lR9epeKnnn0hWheRnamH8
Message-ID: <CAD++jL=OfkGMJMsevYRex_85pm=-xMN5-DjbbCgXAXtkfpPjZQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] pinctrl: actions: fix SPDX comment style in header
To: Mayur Kumar <kmayur809@gmail.com>
Cc: afaerber@suse.de, mani@kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 8:30=E2=80=AFPM Mayur Kumar <kmayur809@gmail.com> w=
rote:

> Header files should use the C-style '/*' block comment for SPDX
> license identifiers. Correct the style in pinctrl-owl.h
> to satisfy checkpatch requirements.
>
> Signed-off-by: Mayur Kumar <kmayur809@gmail.com>

Patch applied!

Yours,
Linus Walleij
