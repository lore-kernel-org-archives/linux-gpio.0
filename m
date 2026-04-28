Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41113AE18C
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 11:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777374492; cv=pass; b=NRWRd6PRfkn9aezmwLs1Y8uaki1O6oOm+iuu96bQ+pML262b7B1JmJT2DbsUOw1fw3XE7dZX3LY0PY2elnAQLQcTBjfk1CJCa04G1/sE3osgrBNHziSjMWmdze4dnKTlRrm2+yPrJpylEoLBOVn4xuC2/7QFnabvZL4CgK+82+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777374492; c=relaxed/simple;
	bh=P7sXRwN+8HwdfMbT03m47sNCwfYJWOz709Eq8ufNO/g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IvpHliXuTepX+7ZKcFIJYpUiizYPwFa3uHzxRIetmFkAfQB3tGdf0WU+3NLTNfQvPxsdLGoCuFaW620OYzDltoB1RH6K5gBfbtTXJWLxx0MZ650ytYz2yDHu8uHLlZFylbISTM6OIei8m7+Oq7rtyVye9i4/VAw/2UqTMadCbuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sINugZnI; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sINugZnI"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-651c5d525f6so10242049d50.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 04:08:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777374490; cv=none;
        d=google.com; s=arc-20240605;
        b=U72CmUTKbkWP8EsmD/RjeMf7Z9qkayGfNlFFw+yvLi4sfmFk61cMs6wwNvZQoynNyu
         k2BCoN7tMiynlay0Xb1w5jgu8R46p35n+aoxgneHWUYNNEmFyMVxkBu2iX4yVZdH+iyf
         xaMDgju8CBIeKOU7cBHvczFe5cHkX5ZBbiystZu2JWXaTwPhvtih+vj4X2HBNsXd/hTD
         AcSctSCTJMQoo9lBNhIle2RRd7TixcFnv8wVeQ4Pz4HJYhrkGSnotwrxOCnPp64C+0fq
         w+kFHnwOuXturandf4kNRTkGwne40eLJ6XCrbkOMvzzFff6ZHdlPDio+sDnGhNOCh2aA
         L8Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sJrrj4kx9/YbHfszfLlPFw11RwCF62jQ3Cb5nlD3I0Y=;
        fh=m0zZaSJtn+Bp/hicv+dOyvFODWH85ZE1Ae9Gul3ohnM=;
        b=hugjG/NUaAG28R9LCB85LMn2GkSZ6F4XMkFyosAZdWPkCs8FEOL0UFA0SVd8nuCUbb
         64VEFJpkmImmxZ/2sry4ExTZ2IQASmPotQ9KxB6Vx+QzFoIbmt1fIyJUtke9RYUy0eOD
         Giz/O5IJxH4mWMxgXgZWEreczDfDwzMvfVJCW1NmRFK5OLYTcaD/ADBsFaV9yC/mzhZ0
         1XJyBerP11jvZM47Bz2s7xxAAeLs2PmjoatuOe36/JSNyxgG3EjMPnzw1djRBHZ0Bi5O
         ZBvIvIHbd2LyOS+LudYvmQpLcECqZdzpLOajQgUqBYUsBrXQSKInQKtkEkHpGwPiQKcM
         r0vw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374490; x=1777979290; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJrrj4kx9/YbHfszfLlPFw11RwCF62jQ3Cb5nlD3I0Y=;
        b=sINugZnIfYjtvazhAhhgULU4EcfMLua6QN3xIizntbkO7dD1RswUU0Na8W/kvR2GuC
         zT2Reql9YL2SSLYFtI9oScEy+lq9YRhJ230QelmTbxmTaLVePtVOAixZNNAf/J99l++0
         6hH8q2Y3oS4XVHqErTTJZBGm1NaBU74SOYYhVcx0gkPaadwNPM0l/06Ry9udiBFEeqfq
         jJgDyngVDQdvxDoLAaUVMNjkLs5f9cofH/SPBjDf/J8S2sdpEpaQweTT3CXq5WPQ+ZQS
         g7dAar4a4emUDq61gUX/JY3x/mWOe2dZ5W3PBlgMZPyP0XeK5r9otXp+jtY8DvC6T1FG
         xOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374490; x=1777979290;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sJrrj4kx9/YbHfszfLlPFw11RwCF62jQ3Cb5nlD3I0Y=;
        b=PqMZvJx5LvwKYkx10Ep+LiOOpVs9WSnwFJ+cf5raGt8msHu/ev+eRZMdEPqMo4Rl/g
         A36gXi6Ho382pLNs8wex0Q7KN8iOEfLeny0LAKj/NNt6zXum3zqTtrwEW+BifOJiLP7g
         iCc+Ip9YG7vBDUZSe2P6K9+W/e7yGr9EAOfFIFkYyKkjR0IQsFEqAbq/88T4iZIs5VTc
         lAWlkiOQwjv+xWs/4yT5/xOc4DQnp/hMCS4rBuErM1aKzAG8EOJp1JIOj+C3/kryZhnZ
         7qv/GcDBUmyIK0GeTh2/2iOweYrNgrwE/LqgKmfctoNFLsq1yjhkVVSe2tpEwp8Ijdtp
         LOsw==
X-Gm-Message-State: AOJu0YwIG7yQvvxHFhu4vfx6NWBbyFkmczt0A4cf24bWUsk2swUlWYPE
	NJ0FWNpTlNwONKefb+CGv++3SPPbdTAFK5Fk4wxFQo5M6SmF740k/Mm0RuM5NoxWatE0NexEs05
	/P6xp4taVwObzSnsHo769HZcwMdCEKgc=
X-Gm-Gg: AeBDieuifXi/oDuXHCmiYU8etD0d8LZFBstbKnmF+IDqDa7VN9mcHZ5VEMvgsj0igmS
	sYqdW+pNaQJO0475TYFTxt2+hSvckNEjg8AcoiRhr4nBkjrfbFJkMdE7rIXmkkqDnsxCMuFvqSB
	NfCXBhB4Y8yoFrRlOVcFwKC4IkiOWCxv3cGZ0x4tQKSieMZnnwb2nv/Ck/TqIHBSjVLHbY51zN+
	mJoYZyXThnDflVkY40QBykPor+p1ZwpceiPpHVG8t38rN+0iRiefneb4Czao0ykzGCfFmKXFfjP
	OkGCfqc+eYiuGbk=
X-Received: by 2002:a05:690e:4399:b0:63f:b4ee:7920 with SMTP id
 956f58d0204a3-65beed670c9mr1543473d50.11.1777374489859; Tue, 28 Apr 2026
 04:08:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427214126.17818-1-m32285159@gmail.com> <CAMRc=McB87bQUBkDoPJaSvh+dx71=bb8sOR9uWSBKyE61cSeaw@mail.gmail.com>
In-Reply-To: <CAMRc=McB87bQUBkDoPJaSvh+dx71=bb8sOR9uWSBKyE61cSeaw@mail.gmail.com>
From: Maxwell Doose <m32285159@gmail.com>
Date: Tue, 28 Apr 2026 06:07:57 -0500
X-Gm-Features: AVHnY4JXhkDpCIOHl2wudE-DsAWsn-84szqWoZQa2DVGeqO00a1joQZStcjcyhU
Message-ID: <CAKqfh0G8gqaoJyKT1TUvQjVGTJAGsQ3ALR8_ozcYJPDLBFy_Ew@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sim: Replace sprintf() with sysfs_emit()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linusw@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 3:13=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> Sashiko is telling me you missed one:
>
>     https://sashiko.dev/#/patchset/20260427214126.17818-1-m32285159%40gma=
il.com
>

Understood, I'll get that fixed soon.

best regards,
maxwell
