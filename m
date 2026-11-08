Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153200;
	b=mxlvYltJGHZDQYinT9d0wrpc3HrZ33GKptJ6czv6fSSP0feqv+XSVPoHvhW0V45LDd5F
	 nRB5jaIUODx6sRUwCuaL7F6601LjVVrz/zBw3LTypj7OpfwUiPcsT/vmU93pNt+uAJOkw
	 Re9kT81p6rvtm1o4PgpaDot8OeTDUvHKD2HQ/C6UJRd41dmUbTyYm3is0Xzsnmcdnht9G
	 55wL/B5jCTp8bdVwiwadW0rFNL6C2kUXUoVzw5DBxbCv9Fw5k2lXhr3D6bvyaZ/VPVxYE
	 9fE5+CPKBhA79pu6LWrkZTmGq88rJAkM8tuJ2+ShrV7gqcy/PXnLinJc7wfasS+UsQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153200;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/S9XJ5Sf+ha4mJ4om/24R0+J7GuBzOrBmWjf2t5Bxd8=;
	b=NtL9/1QeBR1y3Ku7R0CM5Hc7NSVBpTX6/L4i0j65V/rVPFWfWTrABIgILdR5sZmQau9I
	 vTglRpFlB6VFN6MHLVnWor7NHooO0x3KUocR+qQPwrYiqpVnIRSt/YQBHy+tAj3mL0bmq
	 HJwWfWaoffIOfv7Fh0pLHNVqrc8wEk8mljaddumYTUSoAQ4Lixo3usT8AwH6Y0lFsqbW+
	 2/zUb4jSJWQjZK2AKuDI0Idr1Qmbxhjbor3I4pak2ZBifFHXL6MMxDw6QH3WKrnOqfio9
	 2adf1erGwgSOc+Ct+P/3WZjRftXz3ESBq7JrsikwakF146DFje3ipoElPeQxR6p4D9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFJVzurq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6D6606A322
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 15:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cFJVzurq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B0A51F008BF
	for <linux-gpio@vger.kernel.org>; Sun,  8 Nov 2026 15:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794153200;
	bh=/S9XJ5Sf+ha4mJ4om/24R0+J7GuBzOrBmWjf2t5Bxd8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cFJVzurq9HbKbqEWGxr01b1RQqds6QMtBC1E7K90XsZMRtQnK9HSjS+nFUW7T7IsP
	 1XCemhABaTppK7yZQGG/tAkmTDOtTiq0yPwAV66Cc5PQxt/PxinItvHkqIDsSgKzGb
	 NaIHxPjkAoglzLoYp9V7yVVDLWYfRHZtS3BpRQUhwXHoRB0Q0ZEZFIZx6wiIPQ49uJ
	 aaLuW0CDkXvmDBYbhqDT46xbhfycfXg6rGn2sOBzT1r+m4tTApb26Q2Hrnx20etEdl
	 9PdohjnYg224/l+HXjePyqzQvx+azdRrtWzz77DZrjauVgsRBfdLndiQkNy6f2rJwG
	 /nPBWtWszVooQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be4fea434bso188616e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 07:53:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFY+vsNdOXEVlgkAUqgnLM2V+qW5PqUjj6uStUoUc3lUw2eREquLSljax+NKPzLVQ0OocQy6QdC2/gY@vger.kernel.org
X-Gm-Message-State: APuU4Z8k7HT3QohgbAcjIG2By4FQoCFYXILW/pD17KZ0PnBWbaFBJPZG
	g5pBfgnlhRykslEoD/Vi+O/voB5G6WlLrbxb8URT1oVOKLFmAWWm2S9sBI6bk5K7bVTV3n7wczd
	MPE/R+qjmvYcBGunXMATeOp9e1oewd90=
X-Received: by 2002:a05:6512:250d:b0:5c1:4f4a:68f4 with SMTP id
 2adb3069b0e04-5c14f4a6a11mr46761e87.32.1794153198892; Sun, 08 Nov 2026
 07:53:18 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260928063824.1386524-1-morbo@google.com>
In-Reply-To: <20260928063824.1386524-1-morbo@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 8 Nov 2026 16:53:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkm-S_0oDt9K1xn5kOVp7f6KwG7y7nCNE2asD5K69M=PQ@mail.gmail.com>
X-Gm-Features: AclHuK9CiXVomc9vdDMRXSjLJTZjnIEg_krpNQUFLmn-Tbw0yt_ODEgP0qy0xbA
Message-ID: <CAD++jLkm-S_0oDt9K1xn5kOVp7f6KwG7y7nCNE2asD5K69M=PQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: annotate struct acpi_gpio_mapping with __counted_by_ptr
To: Bill Wendling <morbo@google.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	codemender-patching+linux@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 8:38=E2=80=AFAM Bill Wendling <morbo@google.com> wr=
ote:

> The 'data' pointer field in 'struct acpi_gpio_mapping' is associated
> with the 'size' field, which represents the number of elements of
> type 'struct acpi_gpio_params' allocated for 'data'.
>
> To improve bounds checking via CONFIG_UBSAN_BOUNDS and
> CONFIG_FORTIFY_SOURCE, annotate 'data' with the __counted_by_ptr
> attribute.
>
> Analysis of allocation, assignment, and access points shows that the
> pointer is never accessed before the count is set, which guarantees that
> this annotation is safe and will not cause runtime panics or
> false-positive bounds checks.
>
> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>

Prerequisites handled in EFI so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
