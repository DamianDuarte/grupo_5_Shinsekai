for(const tag of document.querySelectorAll('.tag'))
{
    tag.onmousemove = eventObj => onMouseMovement(eventObj);
    tag.onmouseleave = eventObj => resetShadowPositions(eventObj);
}

function onMouseMovement (eventObj)
{
    const { currentTarget: target } = eventObj;

    //* Calculating glow position
    const rect = target.getBoundingClientRect();
    const glowXpos = eventObj.clientX - rect.left;
    const glowYpos = eventObj.clientY - rect.top;

    target.style.setProperty('--glow_xpos', `${glowXpos}px`);
    target.style.setProperty('--glow_ypos', `${glowYpos}px`);

    //* Calculating text-shadow position
    const center = { x: rect.left + rect.width/2, y: rect.top + rect.height/2 }
    const movementFactor = 30;
    const shadowXpos = (center.x - eventObj.clientX) / movementFactor;
    const shadowYpos = (center.y - eventObj.clientY) / movementFactor;

    target.style.setProperty('--shadow_xpos', `${shadowXpos}px`);
    target.style.setProperty('--shadow_ypos', `${shadowYpos}px`);
}

function resetShadowPositions(eventObj)
{
    const { currentTarget: target } = eventObj;
    const rect = target.getBoundingClientRect();
    const center = { x: rect.left + rect.width/2, y: rect.top + rect.height/2 }

    target.style.setProperty('--shadow_xpos', `${center.x}px`);
    target.style.setProperty('--shadow_ypos', `${center.y}px`);
}

