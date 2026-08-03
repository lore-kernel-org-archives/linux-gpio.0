Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8854D3AE190
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743119; cv=none; b=Xnetm091uPNGVICP+QeorkEqvIRnrL/xYna/TfjRhXQOYmFyisnIipMU2iwzbNVZjF3+fRp+P+5DZ/3tMqzCilz2J5Nh0NJx+ITKme0lLGz2lFHQqBpW9ESIRutQzvHPOm8SinTJ8Ol5Nkyl7O4TTb7BfTOWOfnMK+gKLyqPLJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743119; c=relaxed/simple;
	bh=wjRqRiAvrUxHbXRghQcib0401NVid+ELhfBo/AfW6TE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T3N9JIIPzxKe6JnhoxeGGsvlZDCby5cH88zD7v1q3cpf3RpeRzAwZGaozaplBFI4m/JTiFPJ1f8NgTrbcCetUV4Mj/dpibjuAtznx2+gWRe/plZCaIU7TPSJKDTeu4Wo0OG0P5aNVeh170FIvusZUX8Lu3awq0uTNK4M/JVaW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgAdzEP1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgAdzEP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E4581F00A3E
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743118;
	bh=wjRqRiAvrUxHbXRghQcib0401NVid+ELhfBo/AfW6TE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WgAdzEP1nvHyTitqYoR278G7onuCfrfCLQz9Y6k3HCOtGoo0bM6i3xGQEXz+iEULd
	 BUNT+AOXQPTZrdw5jX5KAj97QOInF6RwHqvMWXnbMtNlEhz7K7/ukf5QHRTXaUSHCf
	 QIyS1wKl+9GPVuJHIOwLJl0rVBOjZtCRbhIYhnFy2YerhAUkMIiAoHjAhYGfsBidoD
	 tREwJSgi0FcLCPVljHBvNjigOQElnsFjvHIDBCBlTDss9jPS3NXGiwCUvEbRygz+qd
	 NqWIfRJH3n64X8PQ7So3jqW7w3u+uKGOs+eR3nut9bc4NLVdgLY3wQf6wKfizZ+ks/
	 XCnonZzTfFWRg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b0117dda13so2825279e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 00:45:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpD223tib7ze5o+aIpCsfofBK75MfQ+Jyj4TDRh/pAPlh0l/Dy4S/HzBYm6neaW4FfKUWBoP9rRlBei@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8MvqzW734G0/2q+Z3hZtZ0U0ik13hCjyrzA81CI5OIvsxheJ
	NCuE3Cj5krzaH/CMBMwSRo11BSzwbKPPujMPiP/qBPIPxQbxOI3JkENlQcstz93pqWm2FUtskIf
	XCJPfOBPwLcGS9q0yxgbnKHCpkgWk0Y4=
X-Received: by 2002:a05:6512:3e14:b0:5b0:1eed:f700 with SMTP id
 2adb3069b0e04-5b2e4f1847cmr1705599e87.13.1785743117162; Mon, 03 Aug 2026
 00:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729075437.101025-1-kr494167@gmail.com>
In-Reply-To: <20260729075437.101025-1-kr494167@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:45:04 +0200
X-Gmail-Original-Message-ID: <CAD++jLmYviP9b1eTGws4qD6JSU42Sxmw5cSKTWZZGjqPa3TL2Q@mail.gmail.com>
X-Gm-Features: AUfX_mxuILdMOd01XQe1L6_kzoXeeHdJBy5FpkZBXpIaVyzI8QxJeyv05ZkUwHg
Message-ID: <CAD++jLmYviP9b1eTGws4qD6JSU42Sxmw5cSKTWZZGjqPa3TL2Q@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: generic: free maps on pinctrl_generic_to_map()
 failure
To: kr494167@gmail.com
Cc: Frank.Li@nxp.com, conor.dooley@microchip.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 9:54=E2=80=AFAM <kr494167@gmail.com> wrote:

> From: Surendra Singh Chouhan <kr494167@gmail.com>
>
> pinctrl_generic_to_map() parses DT configuration and allocates pinctrl
> maps via pinctrl_utils_reserve_map().
>
> If subsequent steps (such as pinctrl_utils_add_map_mux(),
> pinctrl_generic_add_group(), pinconf_generic_parse_dt_config(), or
> pinctrl_utils_add_map_configs()) return an error, *maps may contain
> partially allocated map entries. Returning the error directly without
> freeing *maps leaks the allocated mapping memory across all drivers
> that rely on pinctrl_generic_to_map().
>
> Fix this by calling pinctrl_utils_free_map() and resetting *maps,
> *num_maps, and *num_reserved_maps in the error path of
> pinctrl_generic_to_map().
>
> Fixes: aaaf31be0426 ("pinctrl: extract pinctrl_generic_to_map() from pinc=
trl_generic_pins_function_dt_node_to_map()")
> Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>

Patch applied, thanks Surendra!

Yours,
Linus Walleij
