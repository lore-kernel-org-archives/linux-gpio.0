Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715431;
	b=q49PgP/WcRFyc+BLBRx10O8+LjQu0EEVCCWsR1USk21FUo4gUpDIPQsNz2RZjkCb05NQ
	 ySdeLt3nMIsAEExaREdL2V1vnqjQL+9UDJq1fyWQ36POlJilicbELizuD/Uq2KB4M+7X/
	 pGeMw50LI7+U1kNRyG94x5GQ73dO+NuPNKSdL6f3QDYvxBC7lTi625mVMcQEjgt/SmMBs
	 azEYtgnH0XImPnTJYwOuJ6D1FLNRVbrMpxSPIIpX8CHFPi4NK+sqg3UmYqFWgXatYSART
	 8tON7NpCcpSlhiSXXYxT/+ttkf/nTe6hgRwUYg3VmKcTsuQo1zAVZ9LahOqg1JVCcAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715431;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MnD1gTDW8mwNv3Xwrg4fmOvQ8b4n4P8wuC/NrD8YvUY=;
	b=yXvDWMaWaRg7BN982wTjZ0R21EOOF681BL/XvTfowKxGzBrVulPjmlHi4dnWsnilDAO+
	 KMPqV+HsE7dBCIDfqhW7tsgA0GBEY0ZLE0jLiOl0DgoNCVixhhxATiL5RBJE/KjLe8DQk
	 or74Hal+MZgSyafmiqWYbTJu7dANZWQQs26V4WZeZEPZAfCl13rBzbUszKWNmqbwkDn5m
	 1ZiS1Y4xOBEzraiD5pCAx9QHl3q4vifXVp2NvyZ4MGjWNcUIjSs15K+TVDE0sPjTPyRLv
	 2Jnz8u+kB7RyIENUXsowSWviCsO1AcOhGAzgCMkvy0JovnmKXoSMpOIYbTVMsW8DVpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hA8W8hex;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJPAQMcw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73246606A32C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 14:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73246606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hA8W8hex;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gJPAQMcw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EANCA3690183
	for <linux-gpio@vger.kernel.org>; Tue, 3 Nov 2026 14:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MnD1gTDW8mwNv3Xwrg4fmO
	vQ8b4n4P8wuC/NrD8YvUY=; b=hA8W8hexGteCLQjEla9qM4gMdukCAaucoPKj0U
	0rsC6k+c5RAGSpDzNfHnnATRuNXjjGSRDPgBZddEVZ1CF+KtwGjY4vKlM4huzEMY
	kUmd99ZnDCx1GpwNsqu3Luq2QtO7K9k065Rx+0BrKWrdaGuOkQmW8rzgJeK8PhiM
	+1i2gb6F96zPAP6SvgUT7qpmd7AbapCn+ZCxHG+HcAtDwSHr6q8PviEPD6YOqqE1
	jdn/S1f7RtQsLg4y+KL/6o72gWXLH7Gr3mM1kDjbpqLthyplv5j+yExyz51VEpwm
	YjBtpeTGY29GmKDLmY3WYoHAGZSF11IHR6zFtqtTkSyVmQyg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9an2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 14:17:09 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7c0f07b4e81so731946137.2
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 06:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715428; x=1794320228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MnD1gTDW8mwNv3Xwrg4fmOvQ8b4n4P8wuC/NrD8YvUY=;
        b=gJPAQMcwmi9H5T1PeWLFjrbIG4xz2K/tiQJ85r+8gwAgACSuapDnW8HHVr3V6Xkxiz
         NoxJiVlSVP46cXIBkG7DT1ixAQF1bHnzMhV6KtiL9pxsToBSU5tJuO3I14nm4J5mxRgn
         /b/YESebDOZlbDKmjF+3SEjg/ZnsJfia7UCwzolmrm27Qn2OTtrEU5K4T7/TwmzJ3OOC
         tEe7uyxmLDOKyS3QvAwWe14SQPZgl0jUk/14kbFzoe1jnEmux3+G89EVP0jKYxwEH1O7
         4pgOyJQVlNjG484ILvDxin+i0CbIiEGzQxOgLAC8/QFTISw0XoVlJtUMXxeIkawF14zG
         +iIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715428; x=1794320228;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MnD1gTDW8mwNv3Xwrg4fmOvQ8b4n4P8wuC/NrD8YvUY=;
        b=a8uaag0zmGGmy2DsCVv85ViAlWouEUnya9HQ0KAIQHo5Y1DcKQIYO2ntdcXp7GW0PF
         m9J5H5d+izyW7PxxnmSkRD6AKPZ8Hmh9INcZQGnXRXg8lsIw+VFX1lcUxkSIMbU3Mthf
         Bz8EqbJFhgrLcjSM5MHpQmYH6ZMGQe6tLP31zIVYS2AHgjQ6EJ0RAxZU5o1n7NaFWtyV
         HjCvVHsEK1Fe9iPtlCBs/al3qsrDi/nQ+1KCkoxrIaN9EJU2tAfFUf5KyiWVB1mTail0
         gnC8iDTIAjSvF418/yr6HinPOSjbPezej32r+AIrYWzYwxglHqV71ay2U/uBpAIt+3RO
         ugSg==
X-Gm-Message-State: APuU4Z+oaMtCHBgfoCLahifGJXMabQpmY5zCORQEfFynU2PZX4bO1XSZ
	A9j14XJps9pBKLdEbKbu6pKHQmHiyrpSyil5b6RImrZzzVl7mGtA259uzIgbwQwL70IkmLV/ZFw
	r/IafPP5tg9NEwlHQm7UIVQz6PiOXrnDunHZ/vTD6iPmVwA4X5Wvm2Eas0+PUOota
X-Gm-Gg: AYBFou0fKw/Cv2n9dHS+rTndbY8nBGRj34z2HSho01u+k9T+VWutQTK1aDW/0+gBt54
	s23ZON2utFF0GiLX0A6zHqaZXyoDh6H6yalKC/QfPXaoAgEwfs4zigyvYTF0vy+1l8AWXjUx4mH
	sRqWrEdCikEMillAKWkzagQpqrKmuQLf+4BEbsOxGymMW0iPRU+J1IfaEqBd3szu4xr8fxWtCxm
	jNvtMlH9gSiKS3XcNmxDd48chvXACffJZ5dQTfW86eZtcSiK8SiS1f1DEBBGEzpONAmdBFJv7tz
	tSQgrNDBt70hBn3Su8GpitKdX64RTmdtaKqeh9WaPZmv4rlaatYH5AEMuIe2mGXdstXQvxg8tOC
	TyLVQAAOm5W/YLjfrOsKJ8jDrIlKyzCZfZzVHHoVnkvhD65KZoOvnSLd3Ssg5yiPvWdUZGQiUSF
	M1bQ==
X-Received: by 2002:a05:6102:6047:b0:7b8:1a1b:8e79 with SMTP id ada2fe7eead31-7d071f6fd9bmr4004124137.0.1793715428400;
        Tue, 03 Nov 2026 06:17:08 -0800 (PST)
X-Received: by 2002:a05:6102:6047:b0:7b8:1a1b:8e79 with SMTP id ada2fe7eead31-7d071f6fd9bmr4004115137.0.1793715427938;
        Tue, 03 Nov 2026 06:17:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b789c6sm27034897f8f.26.2026.11.03.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:17:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH libgpiod v2 0/4] tools: new tool - gpioctl
Date: Tue, 03 Nov 2026 15:17:00 +0100
Message-Id: <20261103-gpioctl-v2-0-1660aa3dbe5b@oss.qualcomm.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANzs6WoC/z2NwQqDMBBEf0X23MgmYmJ76n8UDxqjLqixWRtax
 H9v6qGXgWEeb3ZgF8gx3LIdgovE5JdU1CUDOzbL4AR1qYNCVUpEKYaVvN0mURS6LLUzqPoOEr0
 G19P7ND1govbHdVCnZSTefPicF1Gee7JpiVL/bVEKFJUxqJXS5tpWd8+cP1/NZP085ymgPo7jC
 5CCH3SvAAAA
X-Change-ID: 20251001-gpioctl-336556e702fd
To: Linus Walleij <linus.walleij@linaro.org>,
        Kent Gibson <warthog618@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4896;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=H+I1KhlwguiscsdS7SUav5T2SBbljm4tSjeFT2Tmmyo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ezhKavIA2NrrPqeOzOKFUnaepAkbWZ78qONP
 QKJnG8GJVGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauns4QAKCRAFnS7L/zaE
 wx/CEACzF/TkPAUuHl7HyBaeGGxYcNNiz6wyva6weoKWqSr8rfjLHRzVA4+hEyz9Y5gmqA2oavM
 YG2RHsHgi5I0AGaQAaMxzKhbR5tlkmHiPdJZjbRn/Azs8LJfGJGww81+ld9nH7SzhQ3rLgDQ/6p
 /pyqwpwpCy+hFzz17GkU4JPPJv5f8JHZBJqoa63DbNPPK055sl8/jx/8tfTHPGcLHdWCstaKMKY
 M0+4fGLlPG3UHHXOQyJHnNLyXGs4qJeTvHRS0WjHhscnyI4HqK6SVJGdRboJSCKWixpoaYsCOL1
 TpfhBfY6Er8ckEsRzLjAK2uS+ItSCaWbrBu03fobWdJ2PEMhM6LKB3KaSnjVqLxyua7KOK0R7An
 tUTPliwm04LRIf4lnrNsieLKc5nA/rvZYKQTv51E/ROG/mlbXHqWACQIbSes1JVWQMAxWlwVWXX
 8oKzzDTzpN//Q7vZ6DiYtTJWX5WQn77ge4E8GcA/L0JS03feFkKbDFZ+JFOIy1WhLSsT0im5d2l
 F3gbUKuqR+jxrFczQQvVINKXLE3cNw0lRV6n+T8+PUZf48qcZQOmvI1dsiIWc4a1sVIL44QX1xX
 k3IwVJD55/lw3Bbys53TeNc0DXN12pFv74uFG3+M1m7IYoKBNT9e8HfjKv5HaTL++tUAsqyxyo2
 hYHMUI0B/FKSwKg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: VRRgEVSzL-shDYvO_KiLChuC_AGZIG4U
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfXyC42Uzm9bltE
 +QYMlzbGG7cohdKC5TPuNXmdpKLZUEsQeog6hcpJNYWNAH98TDWfblApBLS8ST1AD2WevdEuvte
 29g3VYBmVxYGaXF1XzAz//mj0Evw0c0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX+EOGGKNV0asn
 HFwWrP35FBFNH2O9aOCv01BP5/AoP5a3fy0TqId44TZy84Z1Yhtd5RX6kIPtZXvJS8fhc+2+2iT
 Cw4p+YK8QW0scFShF+YbaWO1FmWlM9NvblkCrnGev4Nc+UJOnUOv+kqmPUrPQ7lqDw47UDnWM0a
 CNJITF+BsdsC43tp/RDKSa6iHzcIllVjH4jGSvw+wnLXe7RlSRnLhClGlrTI9ZBmFUR9Lei4VCY
 ovZ2f/p0IDkYXJhGTvpkXfdSB0M3I+vfB/gCJ5JiXGPcKx0lZr6rIosLA4A5WoxigXr31GeCq5/
 sS3XRAeoRgNV7sn20r5mBG0wOpe03NSLFBi0BDiW4hYleBaAgsHh3stvTO+tJZxvNvqrhB/cIRJ
 2TbUL0hutigl9jddGheTaLL7LLlGG6cF6vRIg9GHZE6feaRxW+tYEy9L2fJALqNDA1F0da6PPGm
 kUpyYVCDIbL3UYsXJDA==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9ece5 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=ZItyjs6AcxNCgqLur1EA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: VRRgEVSzL-shDYvO_KiLChuC_AGZIG4U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

Provide gpioctl, a new command-line tool for persistent GPIO line control.
Unlike gpioget and gpioset which release lines on exit, gpioctl holds
requested lines in a background daemon so their state survives across
multiple client invocations.

Before adding the new program: move some code we'll reuse out of gpioset
and gpiomon and into tools-common.

This is a v2 of the RFC I sent before. It's been quite heavily reworked,
the details are in the changelog below.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Make the server startup more robust: use lockfiles to rule out races
  between multiple processes starting a server on the same socket
- Add a "startup" pipe allowing the server to communicate errors to
  client before the server is fully set up and the connection
  established
- Don't let slow clients block the server: drop a client that doesn't
  read data sent to it fast enough and make client sockets non-blocking
- Make the default output of `gpioctl monitor` (without the --format
  option) match that of gpiomon
- Set output values together with settings in build_line_config()
  instead of having these ops split into two far from one another
- Fix an unnecessary double fetch of the request list from
  monitor_resolve()
- Prefer "positive" tests first
- Map reconfigured values to lines by name on the daemon side and ensure
  the ordering libgpiod requires for a correct reconfigure
- Update loop variables inside the for () statement
- Unify the range of supported event format specifiers across gpiomon
  and gpioctl
- Reword the docs to make it clear that the daemon stays alive as long
  as there are any active GPIO requests or client connections
- Make examples in docs better match the actual behavior of gpioctl
  (they were mostly written earlier with the behavior changed since)
- Use a single counter variable in validate_request_opts()
- Don't let the server die on SIGPIPE
- Don't dispatch pending epoll events to receivers removed while
  processing the same batch
- Abstract socket names are not owned by anyone so make sure to verify
  credentials and only talk to servers and clients of the same user
- Fix regressions introduced by moving event formatting code to
  tools-common
- Only sent as many bytes as are needed per message type, not a fixed,
  almost 4k byte message even for small amounts of data like edge events
- Fix several memory leaks
- fix parsing of the -F command-line option in `gpioctl monitor`
- Use the right die() variants in the server-only code
- Don't look up the user name just to print it in a log message as a call
  to getpwuid() may block on a NSS request for no reason or drop a valid
  client with no passwd entry
- Add error checking when redirecting FDs when daemonizing the server
- Reset optind consistently in sub-command parsers
- Reject empty offsets in `gpioctl set`
- Add meson tests for new headers and functions used in gpioctl
- Fix parsing of line=value pairs for corner-cases, allow '=' in line
  names in shunit2 helper
- Reject too many lines given by name
- Refactor the code handling the printing of line events: use less
  positional arguments in favor of structs and unduplicate parts of the
  logic
- Rework the gpioctl-test-helper program, add more functionalities
- Many other small tweaks and fixes...
- Link to v1: https://patch.msgid.link/20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com

---
Bartosz Golaszewski (4):
      tools: factor out line value parsing into tools-common
      tools: factor out line event formatting into tools-common
      tests: bash: allow '=' in line names in shunit2 helper
      tools: implement gpioctl

 TODO                                     |   14 -
 docs/.gitignore                          |    2 +
 docs/conf.py                             |    8 +
 docs/gpio_tools.rst                      |   11 +-
 docs/gpioctl_top.rst                     |  209 ++
 man/meson.build                          |   39 +
 meson.build                              |    7 +
 tests/scripts/gpiod-bash-test-helper.inc |    2 +-
 tools/gpio-tools-test.bash               | 2394 ++++++++++++++++++++
 tools/gpioctl-test-helper.c              |  196 ++
 tools/gpioctl.c                          | 3509 ++++++++++++++++++++++++++++++
 tools/gpiomon.c                          |  128 +-
 tools/gpioset.c                          |   89 -
 tools/meson.build                        |   21 +-
 tools/tools-common.c                     |  242 ++-
 tools/tools-common.h                     |   25 +
 16 files changed, 6665 insertions(+), 231 deletions(-)
---
base-commit: 114d75e95c92fe5aa5721a0c6da2c56f2414ebb4
change-id: 20251001-gpioctl-336556e702fd

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

