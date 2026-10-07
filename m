Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A663546FC
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 06:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791355753; cv=none; b=UlYT4LvlC22uYHAQQ1hMRJW1Ow0ORHDRJGZaiMRAR+ObE802S2/DZOVrQiksxEG6mjgvh3pc6iPaoPVohM+UlIbvX1ukymllgHhUppgjwOqjfJlulgVadRuwpAvYn348QcYK1UTLJ0g27cD8APCWWpzMuuz/LEZaA5rEHB0je8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791355753; c=relaxed/simple;
	bh=kVXuH7H4PDcskImrivyP/VtzUO54yTkMmhV+cSg/PdA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eEBW/ZRkTEqDV1Mby3+rc+6Re/0eQRVR5WoXAjqduWluvpHhidzYFk81VTeARryD9+/2Fr3BoNYreXWNBylCDrbEt8Bjq5Aj9Tryjj+zQmPzdpc9/E+n6DqzJtO5PhEquOsyXtbLB0kRUI2apNQgYRwEbRsnYbis6sBp1nPj1qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dg/APZQ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dg/APZQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07FC61F008A0
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 06:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791355751;
	bh=kVXuH7H4PDcskImrivyP/VtzUO54yTkMmhV+cSg/PdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dg/APZQ9ejy4HmKPDmWJ49DQjYI8eWTCX2U9HoU5cpY3x9Rp89PIqyA8NLJL0FwtJ
	 GMzK4tUOwWk49yYln+oGbbud0wd+E1ne0Fmx4u/kimPS1vwfpbRml7GQ+ixnK3WLy5
	 adZ7iVP2QncNkxmIKC3Dhq6N3u2YYx+tYwo97iXjIw81UJ7iupGbyvfRCJaeqOgE3+
	 VTVO/i9lEVYeS//KnuemuoJQ9Bhbgdxg47sJreGtLXkIMBl+Vr5niUOqlFYNtkozg9
	 mGCFqSQyXN8Tou3REIxsoHqM2zX/h5J9SJoWUqMbRVurUKh76v8oQHNBpM1OPIMfQC
	 G4LuA1C3AaIVA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso2507042e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 23:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBywsUA6AW6NoyUTQbgfSsrxUGM1kA/PejgdF7Pvir7++px6HmHJJiDLdqZ/+LAWU+PWgQfuXXfRSl7r@vger.kernel.org
X-Gm-Message-State: AFq9FYIMaB+f43LQLVgqBBUeIjnlEMXL7XvvXyL/1ZOj/wxqYz0aQbc3
	ZDMmz9Y/WwBrag/DM4buy/lIfomm70OZ94mOiBLUtiGpezGJjhhtOGi64j0UxhxdRh3WkkrmOJS
	MENUHaHj/66uHkhf8WierFkH/f7P+iAI=
X-Received: by 2002:ac2:51cb:0:b0:5ba:3443:aa2e with SMTP id
 2adb3069b0e04-5bcd06dde9emr392580e87.21.1791355749772; Tue, 06 Oct 2026
 23:49:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 08:48:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLkgBKDvbxsnhsBE_Qqs6TA8how4J2jvKm=tdpx4P+4JdA@mail.gmail.com>
X-Gm-Features: AclHuK9LebUk8FXXJTxUAdYqh6ANC6YbZR1Kg-AkYL0dvrplEgSlwXOq9S4AtEE
Message-ID: <CAD++jLkgBKDvbxsnhsBE_Qqs6TA8how4J2jvKm=tdpx4P+4JdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 12:56=E2=80=AFAM Alex Tran <alex.tran@oss.qualcomm.=
com> wrote:

> This series refactors the SCMI pinctrl driver to eliminate metadata
> getter callbacks to be replaced with pinctrl and pinmux generics
> provided by the pinctrl core.
>
> Previously, the driver implemented its own get_functions_count,
> get_function_name, get_function_groups, get_groups_count,
> get_group_name, and get_group_pins callbacks, which required
> maintaining driver metadata like the functions and count.
>
> The pinctrl core already has support to store and manage this
> topology in the pinctrl_dev via its own internal radix trees.
> By registering functions and groups at probe time using
> pinmux_generic_add_function and pinctrl_generic_add_group, the
> driver can delegate group and function metadata management to
> the core.
>
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>

Patches applied!

Yours,
Linus Walleij
