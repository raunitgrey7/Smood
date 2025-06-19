from pydantic import BaseModel
from typing import Optional

class MoodInput(BaseModel):
    gender: str
    religion: str
    age: int
    food_preference: str
    parents_status: str
    relationship_status: str
    siblings: int
    position: str
    employment_status: str
    socializing_skill: int
    genre: str
    friend_description: str
    fun_last: str
    sleep_score: int
    free_hour: int
    patience: int
    support: int
    procrastination: int
    stress: int
    criticism_fear: str
    criticism_reaction: str
    challenge: str
    fear_loss: str
    superpower: str
    gratitude: str
    support_needed: str
    self_improvement: str
    existential: str
    screen_time: float
    most_used_app: str
    addiction: Optional[str]
    disorder: Optional[str]
    feel_understood: str
    one_problem: str