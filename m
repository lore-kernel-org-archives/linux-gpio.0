Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA20A43D515
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 11:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459658; cv=none; b=D73KuRPL49CtFM/KZrz/j8vcXWhpmZuCRdgAt9zwGbbodTAbL9yWfujGGfHYpNNF8tSyASeo4MedBSG+TOu3G6DR7jwJMo41Thl7ihT+xPHEI+atFjPmKeeuPe0c3kK8WlG5rEU/cZLXYEZymgp4cEtOcF8P5ZAQp0LAP9EZhtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459658; c=relaxed/simple;
	bh=1TQ86GqGHr02WiXrkqs6/ykSaMo1V6zc22AmnXa6ivA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wf4wYa8By0knJ+ewEnLiDfxaw9ZbbMhQ30FpgR9XHY2SR6cux8TJzzJIx8dTzqx182dbxmQfOYs4bchoZfgLXK4sDkKsrF/v3YYto4rH5gMqVJKUqPrs22KB5vqnrsnGfQy8k4+qmQlAlhZxQZL3/Yl/5LFJIWW+iKCbIx1LbaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feIwh41G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feIwh41G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D8851F000FF
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 11:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459657;
	bh=1TQ86GqGHr02WiXrkqs6/ykSaMo1V6zc22AmnXa6ivA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=feIwh41GJn8YCn/4KSN9lWeso2qN8JuJwr5VHifaaygMMC4rQTwB+YUz4R4OO0qKp
	 j/OmG/ue0pRW1Z7sfDeTCfkJFqHh68urBdn/NPPAQqrW1X5RRPoPe9vgQIF+6P5vxI
	 nufI8dztGJXCvmkYn0AkwN3Xz60mfQjuyCoRgs7koNM7eO0MIs9cJNOzaXPAFDnNEJ
	 Coipwg57e3CkPijspaPka5fc8+IT4NnaQT/bt83i6JBgoKACBLyXkT5wP88Hp1EyzK
	 8rV5U0v6IL0CNwNhp5spsS/YHuwpZ+J6ZsY6FZOmxEr1jw2h+s+uzImo1KHCLa2sgC
	 lqpZv5xvATS3A==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49dfaa16190so423437fac.1
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 04:40:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhbMGr77RZy3tI28gMg4u8dL+JCMSdNAUTLB9vj206t5JnxOxxW7G+LJVi2vBWU8LgFNndq0oxZ/ED@vger.kernel.org
X-Gm-Message-State: AFq9FYI0fZABE2FUDHRuAFCRbH2PL7cv4ghFflEjFLetrxvGH8Bn4W27
	fkH13V/Hz+RilBpThHn7WuojzmgXNmD6HFyUT9i0n7La5vH3Re8prbcuNCUCzHt+u5Ox7RG4QFp
	YjViXRMs5y/L32i06jDvHjY5VJ0Yvkf4=
X-Received: by 2002:a05:6871:73a4:b0:4a2:499c:f662 with SMTP id
 586e51a60fabf-4a280481d9emr1217695fac.3.1791459656834; Thu, 08 Oct 2026
 04:40:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008091857.5751-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261008091857.5751-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 13:40:41 +0200
X-Gmail-Original-Message-ID: <CAD++jL=_Eb+yFHmxio41Hqa2yATEbbwdmtGu+ysc-42-F7p57g@mail.gmail.com>
X-Gm-Features: AclHuK_clrAsn59lX3Owff1s6P71PFw6AVvM-TzDPaNDrchQmq_Juj31qoAH70g
Message-ID: <CAD++jL=_Eb+yFHmxio41Hqa2yATEbbwdmtGu+ysc-42-F7p57g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control updates for v7.4-rc1
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 11:19=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull the following set of updates to Qualcomm pin control drivers =
for
> the upcoming v7.4 merge window. There are three new drivers, support for =
a new
> SPMI PMIC and some minor driver improvements along with necessary DT bind=
ings
> changes. Details are in the signed tag.

Pulled in, thanks!

Yours,
Linus Walleij
