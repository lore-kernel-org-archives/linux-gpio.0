Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3814C9E02
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 13:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774412; cv=none; b=UIfWhK/tsI09832+gHsLAgD6swg1+EMJxADyuJ9MoP76eXieU2/17/qK5d/OMqtMZpoyGSZd8dCKJCvnUeIBDAo0S0pD1cnyamC4Egb6JBnkup7BiClsWBop1v2WWuXt0nKOhCezARRRQMogX1S/IfWwEi8bDUh0o9yClDQFJtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774412; c=relaxed/simple;
	bh=pJBXlHq1OFNpmmLLzqbU2cvZX0LaMTVQsIWc7wm7TlQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NYrU7lG1T1f3q8TcZEECpnV4oPEeGlQ5wEgMAne0Gh/hx7GG3D1DfbqJgXZMkPXtZq1lM8dc6UZaOPyySaXULvEG419svDnoCtdbMMcjcgCHWUPl/0A4ZLaATkfPiA8h59qgvqbs3P7zMhwJZhCksCudD2Yw0VPsfRcrNt8jYe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lYUS1/wI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lYUS1/wI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAFD51F0089A
	for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 13:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774388;
	bh=pJBXlHq1OFNpmmLLzqbU2cvZX0LaMTVQsIWc7wm7TlQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lYUS1/wIJ2lDVUIuqP18Ii0/hE2k+jzc2EHzjAiFzGqzzVQyr5AOxXXtxqNHDbulT
	 5+Qr4dy+R8jqLH+e//Mp4S26GoBYWSTCHR34O+uJuNvJt2svQmfmPlJ4R2XpYlkQmu
	 2eYDU8ToGHxgTF7JJR0qIdCOtq6aHkfXLRyrH4z73oTe6GTomoYM17sJejY9ew00ju
	 Og/sITUQiltmZT+JiL9EcCUwHUz8/5nv5FW/gtBzJ/vWIP5AmlxDqrntt08Tz25ipi
	 oEJ1BRi1b42nfeI1fh90zRjguhgD4NKHAsL5GmavhOCkaNHkpswAf97p9ywagt3J4N
	 ceTSkphzkfdfw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b78so4869552e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 06:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwbT8gvOx6mjSvVrAQcf+wD/cUO6hfeqI36JfpdNxTJEjeqpnozct/uwt40cpYXLtduCm5AM5gyVOC+@vger.kernel.org
X-Gm-Message-State: AFq9FYLOFKp25cSaLHh9WXsfGe4w0zVShOiNsRJMobsdV0fpFD3rSi7d
	CO4QeXEGtyByp6MCUKhwPwcyYfeRXbzT9c/RoxVc4glhXBTIoIHNKxTk7o8uPw2Ge7vkVomWlOT
	fcIDpcvE7ekRd1ih93SKWfNPube/WJ38=
X-Received: by 2002:a05:6512:2343:b0:5b8:da5a:937c with SMTP id
 2adb3069b0e04-5ba405fdf29mr644077e87.17.1790774386711; Wed, 30 Sep 2026
 06:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917180339.49882-1-sinha.aryan03@gmail.com>
In-Reply-To: <20260917180339.49882-1-sinha.aryan03@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:19:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLm2hMOqjAGq7BCAacCnXKJL_yc6u1nkS5EODENVnT-vpA@mail.gmail.com>
X-Gm-Features: AclHuK8Osm-3e1OZINy-_8-iOwx9Q6Y4zfZjr6XqLptuGmWjVabLOIN-BWaHHyc
Message-ID: <CAD++jLm2hMOqjAGq7BCAacCnXKJL_yc6u1nkS5EODENVnT-vpA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: gemini: fix kernel-doc warnings
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 8:04=E2=80=AFPM Aryan Sinha <sinha.aryan03@gmail.co=
m> wrote:

> struct gemini_pmx documents a virtbase member that does not exist and
> leaves pctl undocumented. struct gemini_pmx_func is missing num_groups.
>
> Drop the stale entry and add the two missing ones. No functional change.
>
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>

Patch applied.

Yours,
Linus Walleij
