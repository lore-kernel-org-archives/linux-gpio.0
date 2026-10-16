Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C68D35675E
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792160309; cv=none; b=VkbUg7nMz011wpMEOv59iEwJxCeKaLv0ryYyr6VBHZyfbxN5igCgY/i5ZxcoGSW6g9PmrjLnztw0dspV2BoePX2d8j0YENcOFmz3lfF1sOWQmlQbZZXVEsCISqCQMQrxY0waAjQMJaDnkl158ZkzSU8GpfHl0Ho6Uz7qbuFXWiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792160309; c=relaxed/simple;
	bh=LDVH0Q8zKes1T3xaGSEw6ncDhxSKukNejNiL+/PODM8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HZZHQgVbkaxc1rPFj7/XCah3HMHU2C9c9iMpV6ijtTNfx1AaasXjd7Lv+2+Je0sjJWJtQV42hl0FZsDzSIgMnt248Ru5a1V2dRoiw5jtM3xY2IFJgEzy4j7nvLhUKwHOTIPMULcIkFQQbQZoUiPjZIN66oQFQjMtyH5NSNBQOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gCcG4Dc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NBgym9yi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gCcG4Dc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBgym9yi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GE6AfG2455480
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wSXWjcYJI5JnpF/EhMfPrM
	GySQslhtLUQvwhc8omLzA=; b=gCcG4Dc9ouUZG1+X+kVlSsMAhdEi8GmcffJz+y
	Sq2bM/j4WDK4GQW5y2llkUo/PKIZ8teMPxAft7S0DoqAAZifxIgoRMshKBfRTYbY
	67VFIAVPDnPLdugUjCqPHfwpJbmpOx54nTCRoyV3VJsryDYe9HhkbjCVw79eXfTd
	oaHr4yzQIXi/LZrqi5osSQrjcBb9Tu4s7+LhsK+f/R7pBHiDZYWseRV9vy5SuuqX
	de7dt3DHk2tz5CLT5udY6zOrsQKtgSc4LBeaLBF25J92Jl+0Aq+f6Kn9qzzRtrv4
	LA5ftff7573S94BpNw75wKPzFfW79/sMKDYuMTrVxUZk/Muw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5ysbhv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 14:18:26 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-98c88cefeb3so314694241.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 07:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792160306; x=1792765106; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wSXWjcYJI5JnpF/EhMfPrMGySQslhtLUQvwhc8omLzA=;
        b=NBgym9yiEXfGbNMvqok4dPIDhjlV8yTg5oy17zQZm5yjGzGtt0yN8n2be/1YYEbC7G
         kOPyjHIHnWb5H1hYVWWaLRfQ94E11t2gjUBRnHSopAWzhSAglUTu7ltdfvi+FUK8oaH8
         BdNLs4evzc29y1XFpg6ktHy59+0O5Ex1/qI3fqP7JoUkJkiMJ4SsMq9/2zIrm9DN16ns
         73EYwBycz0quQy8H5kll7Sjt397LST2KkLlNwk0ga0zEV6D2ZmgW/Qsm/EAf9rGPEMD2
         BVSEmFpfIQazhofcNcB59nI6KGfm7q/zKzVFmZ5rqnvt/74lkr/rBEUBgfCr9myfsE6+
         mc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792160306; x=1792765106;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wSXWjcYJI5JnpF/EhMfPrMGySQslhtLUQvwhc8omLzA=;
        b=FDQzjIMkwYjxXgRp0yq3SgHcyfAoOFnuFBz2Yfu+DeUcW2Fd80q3jnFgXHNb220K6E
         dDBAKFgl2SqZU26SvLrhJB9Krlly0ojwRk5VlQgj37MUfTRlv3nINaD89h/kNG8TH+M5
         Yx0k7ey3lMwE+FL9GORmYjYbV7/FUQid/7eu6Mz/YEwpvRZW2hrXZW3UwLGjWc/yJ7sX
         nyCDHI6a6aYTPY+er6N4ef8Qk5fzNIo5bow0Qr584rpih5sQSEZwkfs4V6HG2WScBy1l
         M9TgOnYnvHhqPGO9s4uN6qRZl5hZlr6O/Dq1JVx2LI539NNUw0yBY3c1B61Wyd3GXBG9
         iFJQ==
X-Gm-Message-State: AFq9FYKxQlIbWbr7D0zGsZ5P5ZAizxq/+zTgSLBT0bssOrRRN2tu/Zxi
	bXJcUeOd+6qdrE02koOL4PTcwHhUwKXGL/pJOINeXQdDrplL5VEFy4NjCmM0T4OkZNlr+NTmHUe
	+yb4CL12egqI+xNjuGRcMLxx5s0D2ydkHGrOrUbNtSSYpuKTj4hAD/bQ9XCYUVL4h
X-Gm-Gg: AYBFou33OECHlZy5iQu70nfcXTt+pGOjH8zsoq5FHYPHD6pzJKLX4t6dySKr57KfVeH
	aXvY46iyehqhLiunK+SHN1WArGZWqfRVOMZ7KKiRpWl824JTyOETxby6y6c4D5zKP6zXxWr3Tvz
	ah17Yy8isUwEAFOw+lRNKd1Q/7oPiS+EZYnwTGVM/0M7TRGJm09w2ldKmtZDh52aH0/u7O57Zkz
	vpUFlEY9rUUWpiDShC+pPDWBjIdlxS9TJTt2adrs0eQk8WWMSC7dR+U/F6+tyVhEQ1tKYlOvO4V
	txmxNL6fbp4tqSfMVzXjz2dte+5cOz5LMorFiqeS/tF9SYt7W15wnRFDYO/1LPXjevFkapyTXnz
	zhtwyeNQ7NVqoXFyFWCfAqzKeKnYn
X-Received: by 2002:a05:6102:8088:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7cb372f3a68mr8081906137.16.1792160306220;
        Fri, 16 Oct 2026 07:18:26 -0700 (PDT)
X-Received: by 2002:a05:6102:8088:b0:7c1:62d2:e18a with SMTP id ada2fe7eead31-7cb372f3a68mr8081894137.16.1792160305708;
        Fri, 16 Oct 2026 07:18:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8de682bsm58835365e9.13.2026.10.16.07.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:18:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH RFC libgpiod 0/3] tools: new tool - gpioctl
Date: Fri, 16 Oct 2026 16:18:07 +0200
Message-Id: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB8y0moC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAwND3fSCzPzkkhxdY2MzU1OzVHMDo7QUJaDqgqLUtMwKsEnRSkFuzgo
 5mUkgtSlKsbW1AA2YGcVnAAAA
X-Change-ID: 20251001-gpioctl-336556e702fd
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LDVH0Q8zKes1T3xaGSEw6ncDhxSKukNejNiL+/PODM8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0jIup4+iW0V4InvaMJxmDgNWt509axzKk2d1X
 VW9TEdlg7SJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatIyLgAKCRAFnS7L/zaE
 w012D/94QfSrp7e590wApJcKbiJM3QsKiFXYHbsvqA9Enx6DL+RAi6h7dOPP0V+fqSZ/04PAPCd
 OcdR6EKzBrosJ8+sSo1lwV6nkhVHIiNda9d/YbOxIUL3R7FkTYOJZOVWplKPgZYYspn6ewJB2Ai
 2l8422eBKhBz8tzoANRtnL8RD0DDh51x37dc6qN35iWUmVHnEbYRVkAG+1hKb/TwFZAznR/u1Vq
 XBzVvfrHG3QQJ1nAHCaqUhbbQj25I6mceneqisKURX4RP3TNsf5ZYZuXyU/qAGvOujppVdu8HzR
 qn5yoF1eODZw9fXkNssBIViK5Pv1C6PtB/Z4F0i5vW61AG3btQp4NGnPV9bKonrXCZ1XA3BTrf7
 wkd/aJc+cbgh+6x/dpSkh2Cz9G50DOxe2Seglyax1hNPJD9nup1nsDnOdPt83BRqWdzUgcl07By
 uB7ltoL3uWjlYK3QSaKRiCNVc3G/AOjaW/poHtw7N6ksErt3fyTbh47ia935OP8RUbZMpexr+XL
 Zx8q1TtvX88iwoxVwjK3TRHERPEZAZl5CaI2SzhPOR7Dnxr10NE5D4icq7ZQtgBvcx0JrOjOmJE
 7agmXmRtmB8ggoS5gD7nXeUBCh0Oi/NWQGFJk9D5Cp44HfohvWWZPBEKjqUdPBVTr8s8uFcADX4
 DsNceLLwIQdAHBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: h7LkMTQtUXRUdajc9qy-n1zg9IjUng4H
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad23232 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=IPhot7q67TBalzEzkB8A:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfXyLquSqBfLglg
 Xzj+TdfbZj7sDEnqD1JX/oQY6HlDTjI+rwkg65owx8EGr06FkvmyLdOA4CtGFKIoX95W6mzM8hO
 n4qhM2nAcX78R0UraRI9mu+G7dVds/w=
X-Proofpoint-GUID: h7LkMTQtUXRUdajc9qy-n1zg9IjUng4H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NiBTYWx0ZWRfX9SF6adYmynW9
 GNWeBIJBLRcPNalmfgWl9iPD6FXNTqaYfOYUzgbK8hTarzR8FAoCt5B7pgEBGUu4BKoZEV9NQhH
 PMfZsvlhrjrPPMd0J2lPrTu9TQxUvFUGJlDuS9+5m3pFMGVFAVIvwXj7A3DtS3zqp/LYGHwINfa
 PtqGkD2WCviLOGsDtiQTCXknH7d0vPYmoULhK8rqdZQ3S36KFow+nIX7LlFeMjU1BLT3bW2vYhO
 M3WzJmtsErjz9Y02qXesUxKGvqBqgP6NihE/mrzy5Pw6igwMR5WNnkf0eRQb66SGGcVGFIqDZvU
 L5RKzkpSKQXdjj5UAioJ39DEFXnFzdWA3oyEkrTdoq6vRp1dQH8aZEAC4wS+D7eYWsTyb4YkpJZ
 GR3gMUUS7mK0kiwMIxC08vmfY7wLY5MOF/6MabejyQn//bpcneWER7WA/NEi+Z4V6scNyIrNkZs
 Jf3UnSLyPoggwCDlxMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160056

Here's is something I've had in the works for about a year now. It's
supposed to address the biggest issue with gpioset, namely the lack of
persistence beyond the process' lifetime by working somewhat similarly
to tmux: spawning a daemon on first invocation that retains the state
for a particular user. This daemon listens on a unix socket and can
handle clients that are different processes executed over time.

It's finally in a state where I'm happy showing it to others, so please
take a look.

--

Provide gpioctl, a new command-line tool for persistent GPIO line control.
Unlike gpioget and gpioset which release lines on exit, gpioctl holds
requested lines in a background daemon so their state survives across
multiple client invocations.

Before adding the new program: move some code we'll reuse out of gpioset
and gpiomon and into tools-common.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (3):
      tools: factor out line value parsing into tools-common
      tools: factor out line event formatting into tools-common
      tools: implement gpioctl

 TODO                        |   14 -
 docs/.gitignore             |    2 +
 docs/conf.py                |    8 +
 docs/gpio_tools.rst         |   10 +-
 docs/gpioctl_top.rst        |  156 +++
 man/meson.build             |   39 +
 tools/gpio-tools-test.bash  | 1756 ++++++++++++++++++++++++++
 tools/gpioctl-test-helper.c |   58 +
 tools/gpioctl.c             | 2838 +++++++++++++++++++++++++++++++++++++++++++
 tools/gpiomon.c             |  128 +-
 tools/gpioset.c             |   91 +-
 tools/meson.build           |   21 +-
 tools/tools-common.c        |  180 ++-
 tools/tools-common.h        |    9 +
 14 files changed, 5091 insertions(+), 219 deletions(-)
---
base-commit: 25c56387337390bbbe42d145faa829c35f9c0611
change-id: 20251001-gpioctl-336556e702fd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

