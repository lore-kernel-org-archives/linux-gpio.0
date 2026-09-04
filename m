Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B80942252E
	for <linux-gpio@vger.kernel.org>; Fri,  4 Sep 2026 11:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520296; cv=none; b=oSHGPRK7wZsrnmykOzXyvYZ5x4ZnE7AksAyh4PI187PYDdTyNESl5z8GrJdwLKCs7cyhX6dmvyey+biFD62v7OJ5nky3ONX0QJNe+OQGRVbzbeCw7GtE9rXCSShL2O/0oHGZfrTaKMmpzzb1zwd9HjKdvdFNT4z1TiKJe9Ty6Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520296; c=relaxed/simple;
	bh=kogY6TLSuVIt/3sC1dBhtpJjb2uFidHomRE45bNUWKg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tq/GcEHkCmTvkViv3FEmGRypPNyfA4vxQN37+5msFzLAFbgz+OTeEspbPOl1ogtprU5jLRGsuu6BnRZftZIBlPhwqxrRQwYrACV+0pDd9bzxAa9eLw8+ikxlS5sX+Zo1vMMtWWRipNXg7pArfMMJweuHOjK7/AJ9w1UNXciZlE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c5a818a3d6so738397e0c.1
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 04:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520293; x=1789125093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DEMMEYg5UPRjTvJH6bpCIIVqiRbyQhNHEX2ipUmBsbM=;
        b=L5jqgD47vmZqq12xuGPlrHoCOWG5t9y4pV5KeAMZBfmy9lghDFn5bmVwu1giPCVtkI
         2ogbERdKezpYskNyGKDfEj/k1I/s6DephubZIilCAtppFbk6wHoDRnoduR8de1LThxoN
         ZeQRKOkSyOvz79f77yrxxngL4DB9ODOS5x9+TacXpDTfWEemOJuY7IDqDGnuGwe1g/KO
         sP85TAG6wHzAXOACg1wmz6si93wS5tODZY7lvVTY9Pclb4gDFd3d1Ndq6RWMV7Ta7hGv
         wh7IiHqFSKrEXe95t82evgcF9h2qkpg9a5CRmrAqaWhAyhlnmfoFC8LuD8VMQp2Rb31p
         7vEg==
X-Gm-Message-State: AFuF++mxIoJrqIby86KtC/gNmr/ZCoREwMBWFd4SYZEwCs73EW5aqGzj
	KDOtb/XiZF3UB1j454VrO3wfySyPKMM1s3eYrVODv9iG6loN7tBd6IIPBmjZY7JeI4M=
X-Gm-Gg: AYBFou0hItWca7qw9qIb7vMQIpOfznS88tQOiL+VGXHxut/5gTFOQ3/UioSpCu/FU33
	yVdaYxC08QM9cCqwRLwofhNM03v70DLrgjr5H2R+J6KHBK1sU01CpqF5oprkZsk+XQO1+Vj4kCp
	pjCwNCzqZxyQ+/Hs6kfaRLzXAl2S5kBZeBw6W3X0O9pXwZtfHyAMzBRz2ZkUejrQ9vPxY4Fu7h+
	J4SmUrGQ6rk0iFFnyCqmSqwkeD6xa8uZgSmgQF9OlVetzzV7130IeqMxhSTjZ7oPGqCyqlN6EzI
	9Rd0U4tPNP6q8FsVidAo8n59ZLk2Fkw3qCfDS2JtdA7roSBWO9YUm1HVdIZDtweYLKB3DkZwB4T
	0LB3USuJsRrTUgC4AmLKDvs8VsI2aWr33BKhBN/FfjgHwnAp3hkkimd4lANYqfZk1ATLjxA/54B
	AUI0AERLwTBwmC6Wm9nSXw6ono9nOIcW3Wdw3p0tFGMD5KOBPL8GC1V5apttcUKzJPwZxdLqBj/
	+Ta8Ehi0zfFgmpXshamstQtYLuyhfDxO9Wn
X-Received: by 2002:a05:6122:e189:b0:5bb:eebe:7ffd with SMTP id 71dfb90a1353d-5c7ed846723mr2539471e0c.8.1788520292991;
        Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec3874acsm1727641e0c.15.2026.09.04.04.11.32
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97fcda3952aso278428241.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 04:11:32 -0700 (PDT)
X-Received: by 2002:a05:6102:80a3:b0:77d:9fe9:1716 with SMTP id
 ada2fe7eead31-78a4a6e83e9mr2237001137.2.1788520291864; Fri, 04 Sep 2026
 04:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 13:11:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
X-Gm-Features: AcwNN1VWCzUARGrrpc_Qo6UxK-PAKa2dMGWtQC_aDHn_mP1ls1EOnA4D533OdMw
Message-ID: <CAMuHMdVaKuYeEv23AH6MkCU-+Zb22Vo5YYRY=+v56jqf2oN5Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: renesas,rcar-gpio: Document R-Car
 X5H (R8A78000) support
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 4 Jul 2026 at 17:15, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document support for the GPIO controller blocks in the
> Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
